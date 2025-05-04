# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.8.1
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
sha512sums=('0d683d4bd6c38b0e02b14333ff86dc4c7f4e19881e8631cb1fa07fe196611f1ca97068e562da0bdd7785a7dd32774d7317cea8a5da1c51a5bf90f280f026789b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
