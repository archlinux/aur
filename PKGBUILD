# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=execline-man-pages
pkgver=2.10.0.0.1
pkgrel=1
pkgdesc="Man pages for execline"
url="https://git.sr.ht/~humm/execline-man-pages"
arch=(any)
makedepends=(make coreutils)
license=('ISC')
source=(https://git.sr.ht/~humm/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('059a614fa1e969d1f5bacc45b87bd7b4a7ca7730838b18cc874bc2b33c3d0a4ba1d4a8eae6352b208cee7c703e8453fecb6461a382415cd71018fb6264f9441e')

package() {
  cd ${pkgname}-v${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
