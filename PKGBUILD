# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi
pkgver=0.4.1
pkgrel=2
pkgdesc='Library for parsing video download links.'
arch=('i686' 'x86_64')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('libquvi-scripts' 'curl' 'lua')
conflicts=('quvi<0.4.0')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.gz"{,.sig})
md5sums=('a5fa8860c23655a529b3166f6e25c83a'
         'cc7f15518f8ab2fc134bc64f0e9d584b')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
