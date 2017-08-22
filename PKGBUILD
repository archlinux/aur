# Maintainer: Tudor Roman <tudurom@gmail.com>
pkgname=windowchef
pkgver=0.4.1
pkgrel=1
pkgdesc="A stacking window manager that cooks windows with orders from the Waitron"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/tudurom/windowchef"
license=('ISC')
depends=("libxcb" "xcb-util-wm")
optdepends=("sxhkd" "wmutils-git" "lemonbar")
makedepends=("xproto")
conflicts=('windowchef-git')
source=("https://github.com/tudurom/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=("12d3424a88ca5f8bc270c5815d649c02")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
