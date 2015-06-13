# Contributor: cromo <dawid@klej.net>
# Maintainer: SanskritFritz (gmail)

pkgname=kdeplasma-applets-embed-win-svn
_pkgname="embed-win"
pkgver=1348299
pkgrel=1
pkgdesc="Displays any application in a plasmoid window."
arch=(i686 x86_64)
url="http://ksvladimir.blogspot.com/2008/06/converting-any-window-into-plasmoid.html"
license="GPL"
depends=('kdelibs' 'kdebase-workspace')
makedepends=('cmake' 'gcc>=4.*' 'automoc4' 'subversion')
source=("svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/embed-win")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST"/$_pkgname
  svnversion | tr -d [A-z]
}

build()
{
	cd "$srcdir/$_pkgname"
	cmake	-DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/pkg" install
}

