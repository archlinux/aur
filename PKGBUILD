# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.7.1
pkgrel=1
pkgdesc="A user-friendly launcher for Bazel."
arch=("x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")
conflicts=("bazel")
provides=("bazel")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('cf94d10459d3db73994eac038fbfb0dad5d4484ca0a6213acecfd35b4bc9cac0')

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

