# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=execline-man-pages
pkgver=2.9.8.1.3
pkgrel=1
pkgdesc="Man pages for execline"
url="https://git.sr.ht/~humm/execline-man-pages"
arch=(any)
makedepends=(make coreutils)
license=('ISC')
source=(https://git.sr.ht/~humm/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('a4b4a0b4cd3a85dc2d2b916260e1d8641afc422c41781578232037cb90f709a0df7ed2cf33cf05c08793c5076dc49cb694ae45206a390690e15b450b90a508a8')

package() {
  cd ${pkgname}-v${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
