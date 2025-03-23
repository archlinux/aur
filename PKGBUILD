# Maintainer: Tomasz Kramkowski <tk@the-tk.com>
pkgname=timer-git
pkgver=1.0.0.r0.g0cc2c6b
pkgrel=1
pkgdesc='Simple beeping countdown timer'
arch=('i686' 'x86_64')
url='https://the-tk.com/cgit/timer/about/'
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('glibc')
source=('git+https://the-tk.com/git/timer')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"

	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 timer "$pkgdir/usr/bin/timer"
}
