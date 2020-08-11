# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname="bazelisk"
pkgver="1.6.0"
pkgrel="1"
pkgdesc="A user-friendly launcher for Bazel."
arch=("x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("9cb1c2fa418d89e296d09c39c4acf27d32fc80840976796154483b4d962d5fe7")

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

