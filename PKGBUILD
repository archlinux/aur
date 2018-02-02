# Maintainer: Jeff Sacco <trailjeep-at-gmail-dot-com>

pkgname=desktop-webmail
pkgver=003
pkgrel=1
pkgdesc="Aims to bring Webmail integration to Linux Desktops"
arch=('any')
url="https://launchpad.net/desktop-webmail"
license=('GPL3')
makedepends=('intltool')
source=("https://launchpad.net/desktop-webmail/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('8a380b96e244e653c7adad596ee441bc')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
