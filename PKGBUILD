# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=xcfa
pkgver=5.0.2
pkgrel=1
pkgdesc="X Convert File Audio"
arch=('i686' 'x86_64')
url="http://www.xcfa.tuxfamily.org/"
license=('GPL3')
depends=('taglib' 'alsa-lib' 'curl' 'desktop-file-utils' 'vte3')
optdepends=('dvd+rw-tools' 'cd-discid')
install=xcfa.install
source=(http://download.tuxfamily.org/xcfaudio/xcfa_download/src/${pkgname}-${pkgver}.tar.gz)
sha256sums=('37cb7cbf6707d02b0e2082e49e3a8194b6d2c6cfecd2747f78b1a682c00a6815')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
