# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.29.9.2
pkgrel=1
pkgdesc="An AAC audio encoder"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2')
source=("https://sourceforge.net/projects/faac/files/faac-src/faac-${pkgver:0:4}/faac-$pkgver.tar.gz")
sha256sums=('d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771')

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
