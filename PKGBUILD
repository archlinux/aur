# Maintainer: max-k <max-k AT post DOT com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: kezar <kezar@inbox.com>

pkgname=ttaenc
pkgver=3.4.1
pkgrel=3
pkgdesc="TrueAudio lossless compressor for multichannel 8,16 and 24 bits audio data"
arch=('i686' 'x86_64')
url="http://tta.sourceforge.net/"
license=('GPL')
source=("http://downloads.sourceforge.net/tta/${pkgname}-${pkgver}-src.tgz")
md5sums=('c9ab8194984b34e7f7bf55d579c97f39')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "ChangeLog-${pkgver}" README "${pkgdir}/usr/share/doc/${pkgname}/"
}
