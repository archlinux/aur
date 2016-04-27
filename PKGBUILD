# Maintainer: kfgz <kfgz at interia dot pl>
# Maintainer: Vinycius Maia <suportevg at uol dot com dot br>

pkgname=xfce4-netspeed-plugin-default-route
srcname=xfce4-netspeed-plugin
conflicts=("xfce4-netspeed-plugin")
replaces=("xfce4-netspeed-plugin")
pkgdesc="Netspeed plugin for xfce4 panel. Like gnome netspeed applet. Uses default route 
as first choice for automatic selection"
pkgver=0.3.1
pkgrel=3
arch=('i686' 'x86_64')
url="http://code.google.com/p/xfce4-netspeed-plugin/"
license=('GPL')
depends=('xfce4-panel' 'libxfcegui4' 'libgtop')
makedepends=('intltool')
install=xfce4-netspeed-plugin.install
source=(http://xfce4-netspeed-plugin.googlecode.com/files/${srcname}-${pkgver}.tar.gz
        xfce4-netspeed-plugin.install
	default-route.patch)
md5sums=('b88cacc3ecd53798d76855e35a7a4d79'
         'b2ebab59089be208323356fef393640a'
	 '04466c8f600e04975146174a0adb25d2')

build() {
  cd "${srcdir}"/${srcname}
  pwd
  patch -i ../../default-route.patch -p5
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}"/${srcname}
  make DESTDIR="${pkgdir}" install
}
