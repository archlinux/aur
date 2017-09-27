# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.29.7.6
pkgrel=1
pkgdesc="An AAC audio encoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2')
source=("https://sourceforge.net/projects/faac/files/faac-src/faac-${pkgver:0:3}/faac-$pkgver.tar.gz")
sha256sums=('36298549deab66b4b9bb274ecbe74514bb7c83f309265f8f649cf49a44b9bd9f')

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
