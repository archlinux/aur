# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=libquvi-scripts
pkgver=0.9.20131130
pkgrel=4
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('lua52-socket' 'lua52-bitop' 'lua52-expat' 'lua52-luajson')
source=("https://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=('97de4cead30dc181da700cbf3a0ad66ee709fef17f449f75cd43e0376a4aa53c7b2174188130aaa34dcc7ddc578581111f3655cb10f4b0c92df2f75d32c72a02'
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
