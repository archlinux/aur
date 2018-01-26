# Maintainer: Karel Koči <cynerd@email.cz>
pkgname=ttysterm
pkgver=20171215
pkgrel=1
pkgdesc="Simple serial terminal"
arch=('i686' 'x86_64')
url="https://rtime.felk.cvut.cz/gitweb/sojka/sterm.git"
license=('GPL3')
depends=('lockdev')
makedepends=('git')
#changelog="debian/changelog"
source=("$pkgname::git://rtime.felk.cvut.cz/sojka/sterm.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	# Reset to specified version
	git reset --hard $pkgver
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
