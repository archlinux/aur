# Maintainer: Schmiddi <aur at schmidhuberj dot de>
# Maintainer: heapifyman <heapifyman at gmail dot com>
# Contributor: Julian <juliannfairfax at protonmail dot com>

pkgname=flare
pkgver=0.20.1
pkgrel=0
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL-3.0-only")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
  "libspelling: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("2fc4f62743c736c82197bb16b0c921218f25a0e6c2c4da60010d617c08a5250a")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
