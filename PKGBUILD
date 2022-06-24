# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-firefox
pkgver='0.3'
pkgrel=1
pkgdesc='Native messaging component for the Himitsu Firefox extension'
arch=(x86_64)
url='https://git.sr.ht/~sircmpwn/himitsu-firefox'
license=(GPL3)
depends=(himitsu)
makedepends=(hare)
install=himitsu-firefox.install
_extracted="$pkgname-$pkgver"
source=("$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9710ebfb6dc78bd2d3d1ff173b6829e40acdc90670f1b5b71c2ffede5bb9f37f')

build() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr native/himitsu-firefox-native native/manifest.json
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install-native
}
