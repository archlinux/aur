# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-cycler
pkgver=0.10.0
pkgrel=6
pkgdesc="Composable style cycles"
arch=(any)
license=(BSD)
url="https://github.com/matplotlib/cycler"
depends=(python2-six)
makedepends=(python2-setuptools python2-six git)
checkdepends=(python2-nose python2-coverage)
source=("git+https://github.com/matplotlib/cycler.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/cycler"
  
  python2 setup.py build
}

check() {
  cd "${srcdir}/cycler"
  
  python2 run_tests.py
}

package() {
  cd "${srcdir}/cycler"
  
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
