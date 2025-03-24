# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.7.19
pkgrel=1
pkgdesc='Deep learning library build on PyTorch with CPU. Version 2 of fastai.'
arch=('any')
url='https://github.com/fastai/fastai'
license=('Apache-2.0')
depends=(
  python-fastcore
  python-fastdownload
  python-fastprogress
  python-matplotlib
  python-packaging
  python-pandas
  python-pillow
  python-pytorch
  python-pyaml
  python-requests
  python-scikit-learn
  python-scipy
  python-torchvision
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastai/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('108090f95b9fbe8f4287371429864d6d52c95b8d181b3219fe2e171883f1e2b3bd1a762ee9802fa21267aef393f66874d70efe873e0dd04c6f5c9e1b1c4c5903')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
