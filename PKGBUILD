# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=amule-remote-tools
pkgver=11004
pkgrel=1
pkgdesc="aMule Remote Tools CLI and GUI"
arch=('x86_64')
url="http://www.amule.org"
license=('GPL')
conflicts=('amule')
depends=('wxgtk2' 'geoip' 'boost-libs')
makedepends=('crypto++' 'git' 'ccache' 'boost')
source=("git://repo.or.cz/amule.git#tag=amule-svn-r$pkgver")
md5sums=('SKIP')

build() {
  cd amule

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
  cd amule

  make DESTDIR=${pkgdir} install
}
