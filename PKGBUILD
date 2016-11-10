# Maintainer: Tudor Roman <tudurom@gmail.com>
pkgname=windowchef
pkgver=0.2.1
pkgrel=1
pkgdesc="A stacking window manager that cooks windows with orders from the Waitron"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/tudurom/windowchef"
license=('ISC')
depends=("libxcb" "xcb-util-wm")
optdepends=("sxhkd" "wmutils-git" "lemonbar")
conflicts=('windowchef-git')
source=("https://github.com/tudurom/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=("8c5b370d7e27d6ae65199dbb9b5c2778")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
