# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termdown
pkgver=1.12.2
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("termdown-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c4d9fe4ea653677fa99c3d0309b6cf1f3c2ebd8153c32a5870111f25cfed5c1381b33262c3b6c6f00ce95b6e52cfdc83e9f5b60d9b27a2252001970b714f19a1')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
