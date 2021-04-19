# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wdisplays
pkgver=1.1
pkgrel=1
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/artizirk/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('x86_64')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('meson')
_commit="a9aa7472e37a44b1aaa962d3794f68553e9f81fe"
source=("$pkgname-$pkgver::https://github.com/artizirk/wdisplays/archive/${pkgver}.tar.gz")
sha256sums=('5aa739dece0d928fe7ca2f28d7f6b4b6750559ec6a0cd0a7520a4b47cebb6f80')

build() {
  cd "$pkgname-$pkgver"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

