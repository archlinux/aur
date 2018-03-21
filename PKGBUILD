# Maintainer: GreaterFire <GreaterFire at protonmail dot com>
pkgname=trojan
pkgver=1.0.0
pkgrel=2
pkgdesc="An unidentifiable mechanism that helps you bypass GFW."
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/trojan-gfw/trojan"
license=('GPL3')
depends=('boost-libs' 'ca-certificates')
makedepends=('cmake' 'boost')
source=("https://github.com/trojan-gfw/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/trojan.json' 'usr/lib/systemd/system/trojan.service')
sha512sums=('7b8c345780f037c317d8da99366af470e296792761c469417480da1a47c4966728009cd1ec5b84f5a7f752361fb856e6160f2d41b30de282f45d96b0553536f1')
build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
