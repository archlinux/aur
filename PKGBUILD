# Maintainer: Schmiddi <aur at schmidhuberj dot de>
# Maintainer: heapifyman <heapifyman at gmail dot com>
# Contributor: Julian <juliannfairfax at protonmail dot com>

pkgname=flare
pkgver=0.15.10
pkgrel=0
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "gtksourceview5")
optdepends=("feedbackd: for vibrating notifications"
  "libspelling: for spell-checking support")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("7d50911ed20bd39de749c40b090e6db8a5e2985d8ba51804cbeccf61bb966313")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
