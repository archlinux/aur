# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet
pkgver=0.6
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/gtkgreet/archive/$pkgver.tar.gz")
sha256sums=('5c0c9dbcb0495b05a1bcbd9978a3ad13ec50e228ab07b05efc5efc294d1beebb')
makedepends=(meson ninja scdoc)
depends=(gtk3 gtk-layer-shell json-c)

build() {
  mkdir -p build
  arch-meson gtkgreet-$pkgver build -D layershell=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
