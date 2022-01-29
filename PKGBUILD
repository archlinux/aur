# Maintainer: Thilo Wischmeyer <thwischm@gmail.com>
pkgname=lesbar
pkgver=0.5.1
pkgrel=1
pkgdesc="A view layer for desktop widgets and statusbars"
arch=('x86_64')
url="https://git.sr.ht/~salmiak/lesbar"
license=('MIT')
depends=('cairo'
         'pango'
         'libx11')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~salmiak/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("d757291bf65b669288d5015066707cc82b3db2191ca96250a8c411bea36400c7")

build() {
	cd "$pkgname-v$pkgver"
	GIT_CEILING_DIRECTORIES="$(realpath ..)" make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
