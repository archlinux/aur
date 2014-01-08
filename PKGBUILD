# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi-scripts
pkgver=0.9.20131130
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('lua-socket' 'lua-bitop' 'lua-expat')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('46ddfd887260a515199c2e1ba8c46d8a'
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
