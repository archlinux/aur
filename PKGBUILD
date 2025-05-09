# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jakana
pkgver=0.2.0
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
sha512sums=('878d8c35983638cb1c6073541db01abdb77e40b2ebc5b1380b39ec3fbab8432e49e2d1cf556460baa7275ebde114c264af36dafb0af00226a15ebc6fc962d77f')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
