# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: joyfulgirl@archlinux.us

pkgname=quvi
pkgver=0.9.5
pkgrel=1
pkgdesc='Command-line tool for parsing video download links.'
arch=('x86_64')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('libquvi' 'libxml2' 'json-glib')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('baa1d7b25e9fd173e952e27d4aa4b933'
         'SKIP')
validpgpkeys=('E220FCFF9EADBA326FD6B23BBF1D59CCAD00BE50') # Toni Gundogdu

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
