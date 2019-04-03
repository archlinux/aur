# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=alsaplayer
pkgver=0.99.81
pkgrel=9
pkgdesc="A heavily multi-threaded PCM player that tries to excercise the ALSA library and driver quite a bit"
arch=('x86_64')
url="http://alsaplayer.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'desktop-file-utils')
makedepends=('gtk2' 'libid3tag' 'libvorbis' 'libmad' 'libmikmod' 'jack' 'mesa' 'audiofile' 'doxygen')
optdepends=('gtk2: for the gtk2 GUI interface' \
            'libgl: for the OpenGL visual plugins' \
            'jack: for JACK audio server output support' \
            'audiofile: for support of various audio formats like AIFF, WAVE, .snd/.au' \
            'libid3tag: for flac support' \
            'flac: for flac support' \
            'libmad: for MPEG support' \
            'libsndfile: for sndfile support' \
            'libvorbis: for ogg vorbis support' \
            'libmikmod: for mod, s3m, it and xm formats supports')
source=(http://alsaplayer.sourceforge.net/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('25817ebd1e5c36da31a88363315a1bf7a945ddfd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-audiofile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
