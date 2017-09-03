# Maintainer : Rob McCathie <korrode at gmail>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: vinz <vinz@archlinux.us>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>
# Contributor: Daniel Jenssen <daerandin@gmail.com>
 
pkgname=thunar-shares-plugin
pkgver=0.2.0.git
pkgrel=3
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/${pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar' 'samba')
makedepends=('xfce4-dev-tools')
install="${pkgname}.install"
source=("https://git.xfce.org/thunar-plugins/thunar-shares-plugin/snapshot/thunar-shares-plugin-master.tar.bz2")
sha1sums=('SKIP')
 
prepare() {
  cd "${srcdir}/${pkgname}-master"
}
 
build() {
  cd "${srcdir}/${pkgname}-master"
  ./autogen.sh --prefix=/usr --enable-debug=no
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-master"
  make DESTDIR="${pkgdir}" install
}