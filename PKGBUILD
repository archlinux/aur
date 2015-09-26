# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=mate-xfce4-panel-plugin-loader-applet
pkgver=1.0.1
pkgrel=1
pkgdesc='Applet for MATE panel which can load external Xfce4 panel plugins like xfce4-whiskermenu-plugin or xfce4-weather-plugin'
arch=('i686' 'x86_64')
url='https://github.com/zaps166/mate-xfce4-panel-plugin-loader-applet'
license=('GPL')
depends=('mate-common')
makedepends=('make' 'gcc' 'autoconf' 'intltool' 'pkg-config')
source=("https://github.com/zaps166/mate-xfce4-panel-plugin-loader-applet/archive/v${pkgver}.tar.gz")
sha1sums=(6e6df4e9ff98214811520fbfb04c137f0c3b0c45)
install=$pkgname.install

build()
{
	cd ${pkgname}-${pkgver}
	sh autogen.sh --prefix=/usr
	make
}

package()
{
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
