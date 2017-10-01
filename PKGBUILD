# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.29.7.7
pkgrel=1
pkgdesc="An AAC audio encoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2')
source=("https://sourceforge.net/projects/faac/files/faac-src/faac-${pkgver:0:4}/faac-$pkgver.tar.gz")
sha256sums=('b898fcf55e7b52f964ee62d077f56fe9b3b35650e228f006fbef4ce903b4d731')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/COPYING \
    "${pkgdir}"/usr/share/licenses/faac/LICENSE
}
