# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet
pkgver=0.5
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/gtkgreet/archive/$pkgver.tar.gz")
sha256sums=('6ad116076deabe7c01821e6be985a3cd5d3f679afd27e3dfdeceff6f5d72f8c5')
makedepends=(git meson ninja scdoc)
depends=(gtk3 gtk-layer-shell)

build() {
  mkdir -p build
  arch-meson gtkgreet-$pkgver build -D layershell=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
