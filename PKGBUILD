# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="bazelisk"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("29a0afb5e7b4be61baa1f7c954371fab9793f7dc69afaae2b3c8bdf152c9e08c")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

