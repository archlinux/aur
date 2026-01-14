# Maintainer: Schmiddi <aur at schmidhuberj dot de>
# Maintainer: heapifyman <heapifyman at gmail dot com>
# Contributor: Julian <juliannfairfax at protonmail dot com>

pkgname=flare
pkgver=0.18.0
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
sha256sums=("c8cc99327e84328f581d8e9e2b67ff675974b5a034a50045c1d4c88b3e18e244")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
