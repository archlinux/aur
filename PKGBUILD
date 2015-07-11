#Mainteiner: Boris Timofeev <mashin87@gmail.com>
pkgname=libayemu
pkgver=1.0.0
pkgrel=1
pkgdesc="AY/YM sound chip (from ZX-Spectrum) emulation library." 
arch=('i686' 'x86_64')
license=('LGPLv2')
url="http://sashnov.nm.ru/libayemu.html"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('548cf778170a982de8ebcb0880b5518c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

