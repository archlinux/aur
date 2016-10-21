# Maintainer: quomoow <quomoow@gmail.com>
pkgname=pcmanfm-git
_pkgname=pcmanfm
pkgver=0.0.0.0
pkgrel=1
pkgdesc="An extremely fast, lightweight, yet feature-rich file manager with 
tabbed browsing"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
depends=('libfm-gtk2')
makedepends=('git' 'intltool' 'pkg-config')
optdepends=('gnome-menus: applications menu and "Open with" dialog'
	'gvfs: mounting of local and remote drives'
	'lxmenu-data: applications menu and "Open with" dialog')
provides=('pcmanfm')
conflicts=('pcmanfm')
source=(git://pcmanfm.git.sourceforge.net/gitroot/pcmanfm/pcmanfm)
md5sums=('SKIP')

prepare() {
	cd "${_pkgname}"

	./autogen.sh
}

build() {
  cd "${_pkgname}"

  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}

