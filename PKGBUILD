# Maintainer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=himitsu-keyring
_pkgname=keyring
pkgver=0.2.0
pkgrel=2
pkgdesc="Graphical frontend for managing a Himitsu key store"
arch=(any)
url="https://git.sr.ht/~martijnbraam/keyring"
license=(GPLv3)
depends=(libhandy)
makedepends=(meson)
source=("$pkgname-$pkgver::https://git.sr.ht/~martijnbraam/keyring/archive/${pkgver}.tar.gz")
md5sums=('78803817c9e98e05bba124d409176f85')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
