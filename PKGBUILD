# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Based on extra/easytag PKGBUILD

pkgname=easytag-gtk2
_basename=easytag
pkgver=2.2.6
pkgrel=1
pkgdesc='Simple application for viewing and editing tags in audio files'
arch=('i686' 'x86_64')
license=('GPL')
url='http://easytag.sourceforge.net/'
makedepends=('intltool' 'itstool')
depends=('id3lib' 'libid3tag' 'gtk2' 'libvorbis' 'flac' 'speex' 'wavpack' 'taglib'
         'desktop-file-utils' 'hicolor-icon-theme' 'opusfile')
provides=("$_basename")
conflicts=("$_basename")
install=${_basename}.install
source=(http://download.gnome.org/sources/${_basename}/${pkgver:0:3}/${_basename}-${pkgver}.tar.xz)
sha256sums=('26437f0d698c3b16794336c335b40f53fa26aefeb77322e45e4e2501c4cff14a')

build() {
  cd "${srcdir}/${_basename}-${pkgver}"
  ./configure --prefix=/usr --with-gtk2
  make
}

check() {
  cd "${srcdir}/${_basename}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
