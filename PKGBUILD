# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="bazelisk"
pkgver="0.0.7"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/philwo/bazelisk"
makedepends=("bazel")

source=("bazelisk.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("f48b6d2af79ae89dc6963929d9624a16daa3a77423c930cda8ca3412a1c99ef3")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

