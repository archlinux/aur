# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi-scripts
pkgver=0.4.14
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('curl' 'lua')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('72f8ff6639dd3aeaa7f3de17c67266e7'
         'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-nsfw --with-nlfy
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
