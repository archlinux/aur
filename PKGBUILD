# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=greetd-gtkgreet
pkgver=0.7
pkgrel=1
pkgdesc="GTK based greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/gtkgreet"
license=(GPL3)
source=("https://git.sr.ht/~kennylevinsen/gtkgreet/archive/$pkgver.tar.gz")
sha256sums=('85b76deb53899ae322f729aaae2065c788a7acd03fef4f7bd4b5d75b6158b921')
makedepends=(meson ninja scdoc)
depends=(gtk3 gtk-layer-shell json-c)

build() {
  mkdir -p build
  arch-meson gtkgreet-$pkgver build -D layershell=enabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
