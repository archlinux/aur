# Maintainer: Tudor Roman <tudurom@gmail.com>

pkgname=windowchef-git
pkgver=0.5.1.r2.gd2284c1
pkgrel=1
pkgdesc="A stacking window manager that cooks windows with orders from the Waitron."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/tudurom/windowchef"
license=('ISC')
depends=("libxcb" "xcb-util-wm")
makedepends=("git" "xorgproto")
optdepends=("sxhkd" "wmutils-git" "lemonbar")
conflicts=('windowchef')
source=("$pkgname::git+https://github.com/tudurom/windowchef.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
