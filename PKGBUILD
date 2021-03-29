# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wdisplays
pkgver=1.0
pkgrel=3
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('x86_64')
depends=('gtk3' 'libepoxy' 'wayland' 'wayland-protocols')
makedepends=('meson')
_commit="a9aa7472e37a44b1aaa962d3794f68553e9f81fe"
source=("$pkgname-$pkgver::git+https://github.com/artizirk/wdisplays#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

