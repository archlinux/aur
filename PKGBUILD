# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wdisplays
pkgver=1.0
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('x86_64')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('meson')
source=("$pkgname-$pkgver::https://github.com/cyclopsian/wdisplays/archive/${pkgver}.tar.gz")
sha256sums=('fa34d5bdfd87d833e18a89b2acacc27833d7297374719773a705f2d3e89cdddf')

build() {
  cd "$pkgname-$pkgver"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

