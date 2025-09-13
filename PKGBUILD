# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.8.4
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
sha512sums=('f22738fabf9d01f81780ad8c8d9ba638b384152ed91f369982c7dd5e254482268035fbe00167468afb2fa7d8f5db841dc6143aa9bcc1679bffd53dffc6476667')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
