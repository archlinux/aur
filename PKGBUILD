# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=xcfa
pkgver=5.0.2
pkgrel=3
pkgdesc="X Convert File Audio"
arch=('i686' 'x86_64')
url="http://www.xcfa.tuxfamily.org/"
license=('GPL3')
depends=('taglib' 'alsa-lib' 'curl' 'vte3')
optdepends=('a52dec' 'aacplusenc' 'cdparanoia' 'cd-discid'
            'mp3check' 'faac'  'faad2' 'flac' 'cdrtools'
            'lame' 'lsdvd' 'musepack-tools' 'mplayer'
            'mp3gain' 'shorten' 'shntool' 'sox' 'vorbis-tools'
            'vorbisgain' 'wavpack'
            'firefox' 'vlc')
source=(http://download.tuxfamily.org/xcfaudio/xcfa_download/src/${pkgname}-${pkgver}.tar.gz)
sha256sums=('37cb7cbf6707d02b0e2082e49e3a8194b6d2c6cfecd2747f78b1a682c00a6815')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
