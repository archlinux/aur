# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="bazelisk"
pkgver="1.3.0"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("b10d3e3bb5e34c0c0c64c289022589ea7e166158f64b2b515a277304cb458ed9")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

