# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Whyme Lyu <callme5long@gmail.com>
# URL: https://github.com/trollixx/aur-packages

pkgname=zeal-git
# The author of Zeal hasn't settled on a versioning scheme yet.
# But he's using ``0.0+1snapshot201305312045+0100-1'' on PPA.
# Guess it's safe to use 3-digit for now.
_appname=zeal
pkgver=0.1.1.33.g1848e7a
pkgrel=1
pkgdesc="An offline API documentation browser"
arch=('i686' 'x86_64')
url="http://zealdocs.org/"
license=('GPL3')
depends=('libarchive' 'qt5-webkit' 'qt5-imageformats' 'qt5-x11extras')
makedepends=('git')
source=("git://github.com/zealdocs/$_appname")
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_appname}
	git describe | sed 's/^v//;s/-/./g'
}

build() {
	cd ${srcdir}/${_appname}
	qmake PREFIX=/usr
	make
}

package() {
	cd ${srcdir}/${_appname}
	make INSTALL_ROOT="$pkgdir" install
}
