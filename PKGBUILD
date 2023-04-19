# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=himitsu-keyring
_pkgname=keyring
pkgver=0.2.0
pkgrel=3
pkgdesc="Graphical frontend for managing a Himitsu key store"
arch=(any)
url="https://git.sr.ht/~martijnbraam/keyring"
license=('GPL3')
depends=('libhandy' 'python-gobject')
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
