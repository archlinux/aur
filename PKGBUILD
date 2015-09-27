# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libquvi-scripts
pkgver=0.9.20131130
pkgrel=3
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('lua52-socket' 'lua52-bitop' 'lua52-expat' 'lua52-luajson')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('46ddfd887260a515199c2e1ba8c46d8a'
         'SKIP')
validpgpkeys=('E220FCFF9EADBA326FD6B23BBF1D59CCAD00BE50')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-nsfw --with-geoblocked
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
