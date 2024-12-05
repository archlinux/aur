# Maintainer: Julian <juliannfairfax@protonmail.com>

pkgname=flare
pkgver=0.15.6
pkgrel=2
pkgdesc="Chat with your friends on Signal"
url="https://gitlab.com/schmiddi-on-mobile/$pkgname"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("AGPL3")
makedepends=("blueprint-compiler" "cargo" "meson" "protobuf")
depends=("libadwaita" "libsecret" "protobuf" "libspelling")
optdepends=("feedbackd: for vibrating notifications")
source=("https://gitlab.com/schmiddi-on-mobile/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("7dad44a1192f02a4a335823fd9084ad8b0066d28416e74d1c4432b4e2a47caf3")
options=(!lto)

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  arch-meson . _build
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  DESTDIR="${pkgdir}" ninja -C _build install
}
