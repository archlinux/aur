# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=meson
pkgver=0.29.0
pkgrel=1
pkgdesc='SCons-like build system that use python as a front-end language and Ninja as a building backend'
url='http://mesonbuild.com/'
arch=(any)
depends=(python ninja)
license=(Apache)
source=(https://pypi.python.org/packages/source/m/meson/meson-$pkgver.tar.gz)
sha1sums=('8d8329106f7fdcefbd70d32159e34fcc46f97d05')

check() {
  cd meson-$pkgver
  # these tests take too much time
  #./run_tests.py
}

package() {
  cd meson-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
