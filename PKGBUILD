# Contributor: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.7.29
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache')
depends=(
  python
  python-matplotlib
  python-numpy
  python-pillow
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastcore/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0caf1ceb273a9c4f5b8fd65b5cf29c028be07d2a337b425233fdfd2089e7ce466857935359f321398df9ecdfd6ce8f2d84a681efaf78e5824bce69f884211d4f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
