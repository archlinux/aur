# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-remote-tools
pkgver=10871
pkgrel=1
pkgdesc="aMule Remote Tools CLI and GUI"
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
conflicts=('amule')
depends=('wxgtk2.8' 'geoip')
makedepends=('crypto++')
source=("http://amule.sourceforge.net/tarballs/aMule-SVN-r${pkgver}.tar.bz2")
md5sums=('f3c666b6fa518a3e6e2c21670c243292')

build() {
  cd "${srcdir}/aMule-SVN-r${pkgver}"

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
              --enable-ccache \
              --enable-geoip \
              --disable-upnp \
              --with-wxversion=2.8 \
              --disable-monolithic \
              --disable-ed2k \
              --disable-xas \
              --disable-fileview \
              --disable-plasmamule \
              --disable-static \
              --disable-kde-in-home

  make
}

package() {
  cd "${srcdir}/aMule-SVN-r${pkgver}"

  make DESTDIR=${pkgdir} install
}

