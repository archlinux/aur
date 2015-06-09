# Maintainer: Arnau Sanchez <pyarnau {at} gmail {dot} com>
pkgname="bplay"
pkgver="0.991"
pkgrel="2"
pkgdesc="Play/record audio files from the command-line (formats: sample, VOC and WAV)"
arch=(i686 x86_64)
url="http://packages.debian.org/en/sid/${pkgname}"
license=("GPL")
source=("http://ftp.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=("7bb4c7bbd81b83f403b994f8faaad113")
 
build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/usr/man/man1 ${pkgdir}/usr/share/doc/${pkgname}
  cd $srcdir/$pkgname-$pkgver
  
  cp bplay brec ${pkgdir}/usr/bin 
  cp bplay.1 brec.1 ${pkgdir}/usr/man/man1
  cp README COPYING ${pkgdir}/usr/share/doc/$pkgname
}
