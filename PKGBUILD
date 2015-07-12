#Mainteiner: Boris Timofeev <mashin87@gmail.com>
pkgname=sc68
pkgver=2.2.1
pkgrel=1
pkgdesc="Atari ST and Amiga music player" 
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://sc68.atari.org/"
source=(
  "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "doctex.patch"
)
md5sums=('84aa948f76274361f7e78c3563951eff'
         '669451bc5ba1d1e5912be341a9d5cecd')

build() {
  cd ${srcdir}
  
  patch -p0 < doctex.patch
  
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

