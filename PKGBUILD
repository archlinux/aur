# Maintainer: Akritas Akritidis <akritasak@gmail.com>
pkgname=mls
pkgver=1.0
pkgrel=1
pkgdesc="maanoo's ls"
arch=('x86_64')
url="http://github.com/MaanooAk/mls"
license=('MIT')
depends=()
makedepends=('git' 'gperf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaanooAk/mls/archive/v$pkgver.tar.gz")
sha1sums=('c914bea272638f582de58104810a4ca95fe3a605')

build() {
	cd "$pkgname-$pkgver"

	make
}

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/share/man/man1"
	make INSTALL_PATH="$pkgdir/usr" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
