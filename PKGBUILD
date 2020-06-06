# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname="bazelisk"
pkgver="1.5.0"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("f7d44dab2f8d1962192cacf6b33c3fe09046731a8c468a06271b92d258064cd1")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

