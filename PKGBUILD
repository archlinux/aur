# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=bazelisk
pkgver=1.6.1
pkgrel=2
pkgdesc="A user-friendly launcher for Bazel."
arch=("x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazelisk"
makedepends=("bazel" "git")
conflicts=("bazel")
provides=("bazel")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('395a93a945e88234cf5866a6e36af436e0549c46fec3b29160b34fb3c6c6ebcd')

build() {
  cd bazelisk-$pkgver
  bazel build //:bazelisk
}

package() {
  cd bazelisk-$pkgver
  install -Dm755 bazel-bin/*/bazelisk "$pkgdir"/usr/bin/bazelisk
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/bazelisk/LICENSE
}

