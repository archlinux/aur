# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=easytag
pkgver=2.4.3
pkgrel=3
pkgdesc='Simple application for viewing and editing tags in audio files'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/EasyTAG'
makedepends=('intltool' 'itstool' 'python')
depends=('id3lib' 'libid3tag' 'gtk3' 'libvorbis' 'flac' 'speex' 'wavpack' 'taglib'
         'desktop-file-utils' 'opusfile')
source=(https://download.gnome.org/sources/${pkgname}/${pkgver:0:3}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('fc51ee92a705e3c5979dff1655f7496effb68b98f1ada0547e8cbbc033b67dd5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
