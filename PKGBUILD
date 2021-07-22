# Maintainer: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.3.20
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache')
depends=(
)
makedepends=(
  python-packaging
  python-pip
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastcore/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f74094d4b80229fbf1d1bff89530caf71845b85d0933b46777b5941d17d159f7911c3bd9aba8b3cf9a3da802cb31820226e230bac5541dac7ca39733f0cd0317')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
