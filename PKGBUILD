# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Cory Farmer <rbgkofi@ameritech.net>

pkgname=vorbisgain
pkgver=0.37
pkgrel=6
pkgdesc="A utility that computes the ReplayGain values for Ogg Vorbis files."
arch=('x86_64')
url="https://sjeng.org/vorbisgain.html"
license=('GPL')
depends=('libvorbis')
source=(https://sjeng.org/ftp/vorbis/${pkgname}-${pkgver}.tar.gz)
sha512sums=('67181834e1a0d7c6e1ccd984e2d30ebf1dcdff84caa77f75e5e771de8414904810e966a43852b7184e075d2428fd8b431124835efc370ce6504b8b2756746e04')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr \
    --enable-recursive \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
