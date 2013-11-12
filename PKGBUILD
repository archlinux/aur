# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi-scripts
pkgver=0.9.20131104
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('lua51-socket' 'lua51-bitop' 'lua51-expat')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('0ddb9e392b46cee0e7a4af260bc1a1a3'
         'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-nsfw --with-geoblocked
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
