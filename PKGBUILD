# Maintainer: Uffe Jakobsen <>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: Kosava <kosava@archlinux.us>

_pkgname=zNotes

pkgname=znotes
pkgver=0.4.7
pkgrel=1
pkgdesc="Lightweight crossplatform application for notes managment with simple interface"
arch=('i686' 'x86_64')
url="http://znotes.sourceforge.net"
license=('GPL')
depends=('qt5-tools')
source=(https://github.com/proton/zNotes/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('f0d35e50bac515503ee13bce3eb480d0')

#
#
#

build()
{
   cd "${srcdir}/${_pkgname}-${pkgver}"
   lrelease-qt5 znotes.pro
   qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" PREFIX=/usr
   make
}

package()
{
   cd "${srcdir}/${_pkgname}-${pkgver}"
   make INSTALL_ROOT=${pkgdir} install
}

#
# EOF
#
