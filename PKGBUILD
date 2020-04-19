# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="bazelisk"
pkgver="1.4.0"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("4d20541b39de1fe38a5b888cdd44d8111a40586ef2bda026f82ab0df46c70a97")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

