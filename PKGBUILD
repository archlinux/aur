# Maintainer: somini <somini29@yandex.com>
pkgname=xdg-autostart-git
pkgver=r3.03a7df544540
pkgrel=1
pkgdesc="Autostart programs according to the XDG specification"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fabriceT/xdg-autostart/overview"
license=('unknown')
makedepends=('git' 'vala')
provides=("xdg-autostart")
conflicts=("xdg-autostart")
source=('hg+https://bitbucket.org/fabriceT/xdg-autostart')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/xdg-autostart"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/xdg-autostart"
	make
}
package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "$srcdir/xdg-autostart"
	install -m755 -D xdg-autostart "$pkgdir/usr/bin/"
}
