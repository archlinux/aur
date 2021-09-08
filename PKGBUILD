# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-remote-tools
epoch=1
pkgver=2.3.3
pkgrel=1
pkgdesc="aMule Remote Tools CLI and GUI"
arch=('x86_64')
url="http://www.amule.org"
license=('GPL')
conflicts=('amule')
depends=('wxgtk2' 'gd' 'geoip' 'crypto++')
makedepends=('boost')
source=("https://download.sourceforge.net/project/amule/aMule/$pkgver/aMule-$pkgver.tar.gz")
sha256sums=('fa85a054153c9787fce2d35a5c5590a3d390429b8fa0c5d8f9ea69e9904c7b72')

build() {
  cd aMule-$pkgver

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --disable-cas \
              --disable-wxcas \
              --disable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --disable-alc \
              --disable-alcc \
              --disable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-geoip \
              --disable-upnp \
              --disable-monolithic \
              --disable-ed2k \
              --disable-xas \
              --disable-fileview \
              --disable-plasmamule \
              --disable-static \
              --disable-kde-in-home \
              --with-boost
  make
}

package() {
  cd aMule-$pkgver

  make DESTDIR=${pkgdir} install
}
