# Maintainer: Schmiddi <aur at schmidhuberj dot de>
# Maintainer: heapifyman <heapifyman at gmail dot com>
# Contributor: Julian <juliannfairfax at protonmail dot com>

pkgname=flare
pkgver=0.15.8
pkgrel=0
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "libspelling")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("5a2d80290a1f16cbad3a9f58fb9e67ea5788a4e840b42de542f91f3813611eb8")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
