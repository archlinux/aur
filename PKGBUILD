# Maintainer : Sébastien Deligny <sebdeligny at gmail>
 
pkgname=thunar-shares-plugin
pkgver=0.3.1.git
pkgrel=1
pkgdesc="Thunar plugin to quickly share a folder using Samba without requiring root access"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/${pkgname}"
license=('GPL2' 'LGPL')
depends=('thunar>=1.7.0' 'samba')
makedepends=('xfce4-dev-tools')
install="${pkgname}.install"
source=("https://git.xfce.org/thunar-plugins/thunar-shares-plugin/snapshot/thunar-shares-plugin-master.tar.gz")
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
