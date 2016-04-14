# Maintainer: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror-git
pkgver=1.0.0.r0.gab02f17
pkgrel=1
pkgdesc='A highly programmable web browser based on Mozilla XULRunner'
arch=('i686' 'x86_64')
url='http://conkeror.mozdev.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('firefox' 'desktop-file-utils')
makedepends=('git')
provides=('conkeror')
conflicts=('conkeror')
changelog='Changelog'
install='conkeror-git.install'
source=('git+http://repo.or.cz/conkeror.git')
md5sums=('SKIP')

pkgver() {
	cd conkeror
	git describe --long | sed 's:-\(.*\)-:.r\1.:'
}

build() {
	cd conkeror
	make PREFIX=/usr
}

package() {
	cd conkeror
	make DESTDIR="$pkgdir" PREFIX=/usr install
	rm -f "$pkgdir/usr/share/doc/conkeror/COPYING"
}
