# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi-scripts
pkgver=0.4.10
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('curl' 'lua')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('ff79b40f6fb886c144ef18169eab0084'
         '61a80a8653a0e758fd66ba9535a33d20')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-nsfw --with-nlfy
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
