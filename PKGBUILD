# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=0.5
pkgrel=1
pkgdesc="A status bar with decent font rendering"
arch=('x86_64')
url="https://git.sr.ht/~salmiak/lesbar"
license=('MIT')
depends=('cairo'
         'glib2'
         'pango'
         'libx11')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~salmiak/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("5f0af08af4821a5a6bc6c6f9bf941b4ec469a1d1180bc44a9ea1af8ee75173b5")

build() {
	cd "$pkgname-v$pkgver"
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
