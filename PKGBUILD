# Maintainer: Oliver Hattshire <hattshire at gmail dot com>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: alzen <mynick2(at)gmail(dot)com>

pkgname=bmpx
pkgver=0.40.14
pkgrel=1
pkgdesc='A media player and the successor to BMP'
url='http://www.beep-media-player.org'
license=('GPL' 'LGPL' 'MIT' 'custom')
arch=('i686' 'x86_64')
makedepends=()
depends=( 
'taglib>=1.4'
'gtk2>=2.10.0'
'gtkmm>=2.10.0'
'cairo>=1.0.0'
'cairomm>=0.6.0'
'libglade>=2.5.1'
'libglademm>=2.6.2'
'libsexymm>=0.1.9'
'librsvg>=2.14.0'
'sqlite>=3.3.11'
'libxml2>=2.6.1'
'gettext'
'dbus>=0.62'
'boost>=1.33.1'
'alsa-lib>=1.0.9'
'libcdio>=0.70'
'libcdio-paranoia>=0.70'
'libsoup-2.2>=2.2.100'
'gstreamer0.10>=0.10.14'
'gstreamer0.10-bad-plugins>=0.10.14'
'gstreamer0.10-base-plugins>=0.10.14'
'gstreamer0.10-good-plugins>=0.10.14'
'gstreamer0.10-ugly-plugins>=0.10.14'
'startup-notification'
'libofa>=0.9.3')
optdepends=( 'hal' 'networkmanager' )
conflicts=('')
provides=('bmpx')
source=("http://slackware.uk/slacky/slackware-12.1/multimedia/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2" 'update.patch')
sha1sums=('3284843c45cab302f414663a5cb31eb4373d07c7'
          '2439478fdfcb42b97196ea748ba7fb4e5dc1c1a0')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i ../update.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
