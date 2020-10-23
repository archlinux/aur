# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.7.4
pkgrel=1
pkgdesc="A user-friendly launcher for Bazel."
arch=("x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")
conflicts=("bazel")
provides=("bazel")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c6ea1f28b33f9091cbcdefcade83c23c44fd00545ee45a157914d033d01c88f6')

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

