# Maintainer: Erik Sonnleitner <es@delta-xi.net>>
pkgname='x11log'
pkgname='x11log'
pkgver='0.81'
pkgrel=1
pkgdesc="An unprivileged userspace keylogger for X11 sessions"
arch=('i686' 'x86_64')
url="https://github.com/esonn/x11log"
license=('GPL')
depends=('libx11' 'curl')
makedepends=('perl')
source=("https://github.com/esonn/x11log/archive/v0.81.tar.gz")
md5sums=('d419127485a2614d1462711475ba1208')

build() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" POD2MAN="/usr/bin/core_perl/pod2man"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" POD2MAN="/usr/bin/core_perl/pod2man" install
}

#pkgver() {
#	cd "$pkgname-$pkgver"
#	printf "r%s" "$(bzr revno)"
#}
