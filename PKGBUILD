# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=execline-man-pages
pkgver=2.9.9.1.1
pkgrel=1
pkgdesc="Man pages for execline"
url="https://git.sr.ht/~humm/execline-man-pages"
arch=(any)
makedepends=(make coreutils)
license=('ISC')
source=(https://git.sr.ht/~humm/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('bd4ab7d04589003734ef68b5b8f4529a8bcc6c1b387d6e363e5dc9a67d552c5eadc077d4f3eea8ece1d1df21e26833fb4a045377695b0e0c675dec50d5e0e12c')

package() {
  cd ${pkgname}-v${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
