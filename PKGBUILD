# Maintainer: Schmiddi <aur at schmidhuberj dot de>
# Maintainer: heapifyman <heapifyman at gmail dot com>
# Contributor: Julian <juliannfairfax at protonmail dot com>

pkgname=flare
pkgver=0.15.9
pkgrel=0
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "libspelling")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("5a5b169247b9fe7b2ac7dd10ce352b2f1a1fac2c9c016751d157cf181762300b")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
