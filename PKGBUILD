# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=kmailapplet-git
pkgver=1.0
pkgrel=1
pkgdesc="A Mail Applet for the system tray to watch your Maildir box and get notifications whenever there's a new mail."
arch=('any')
url="https://github.com/ichigo663/KMailApplet"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'boost-libs' 'qt5-base')
makedepends=('git' 'make' 'qt5-base')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/ichigo663/KMailApplet.git")
md5sums=("SKIP")

build() {
		cd "$srcdir/$pkgname"
		qmake -o Makefile build.pro
    make
}

package() {
		cd "$srcdir/$pkgname"
		cp -r usr etc $pkgdir
		chmod -R 755 "$pkgdir/usr" "$pkgdir/etc"
		mkdir -p "$pkgdir/usr/bin/"
		cp KMailApplet "$pkgdir/usr/bin/"
}
