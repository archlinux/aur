# Maintainer: Akritas Akritidis <akritasak@gmail.com>
pkgname=mls
pkgver=1.1
pkgrel=1
pkgdesc="maanoo's ls"
arch=('x86_64')
url="http://github.com/MaanooAk/mls"
license=('MIT')
depends=()
makedepends=('git' 'gperf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaanooAk/mls/archive/v$pkgver.tar.gz")
sha1sums=('5eb778a12fe41d71b01555aec4c936e1f2b8f84d')

build() {
	cd "$pkgname-$pkgver"

	make
}

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_PATH="$pkgdir/usr" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
