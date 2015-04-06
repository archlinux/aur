# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Whyme Lyu <callme5long@gmail.com>
# URL: https://github.com/trollixx/aur-packages

pkgname=zeal-git
# The author of Zeal hasn't settled on a versioning scheme yet.
# But he's using ``0.0+1snapshot201305312045+0100-1'' on PPA.
# Guess it's safe to use 3-digit for now.
_appname=zeal
_pkgver=0.0.0
pkgver=0.0.0.823.f860a3e
pkgrel=1
pkgdesc="An offline API documentation browser"
arch=('i686' 'x86_64')
url="http://zealdocs.org/"
license=('GPL3')
depends=('libarchive' 'qt5-webkit' 'qt5-imageformats')
makedepends=('git')
source=("git://github.com/zealdocs/$_appname")
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_appname}
	echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
