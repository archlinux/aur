# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=0.4
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
md5sums=("bda4149e80313bd1784642bb7e0064b5")

build() {
	cd "$pkgname-v$pkgver"
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
