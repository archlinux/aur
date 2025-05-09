# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jakana
pkgver=0.1.0
pkgrel=1
pkgdesc='Learn Japanese kana on cli'
arch=('any')
url='https://github.com/Catalina-sys456/jakana'
license=('MIT')
depends=('python')
makedepends=(python-build
	     python-installer
	     python-wheel
	     python-hatchling)
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('f7d893847b78189b4755b3b7604dee3bbadde273beb9ee946675315c40d5b2038c8a66fe42d2a81319568f100ecc84e46cb419926a02879c1af75ba4f5495661')
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}
package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}


