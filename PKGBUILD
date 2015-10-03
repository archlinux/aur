# Maintainer: Erik Sonnleitner <es@delta-xi.net>>
pkgname='x11log-bzr'
_pkgname='x11log'
pkgver='r25'
pkgrel=1
pkgdesc="An unprivileged userspace keylogger for X11 sessions"
arch=('i686' 'x86_64')
url="https://launchpad.net/x11log"
license=('GPL')
depends=('libx11' 'curl')
makedepends=('bzr')
source=("x11log::bzr+http://bazaar.launchpad.net/~esonn/x11log/trunk")
md5sums=('SKIP') #autofill using updpkgsums

build() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" POD2MAN="/usr/bin/core_perl/pod2man"
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" POD2MAN="/usr/bin/core_perl/pod2man" install
}

pkgver() {
	cd "$_pkgname"
	printf "r%s" "$(bzr revno)"
}
