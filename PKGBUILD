# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.9.1"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel")
depends=("bazel")

source=("bazel-watcher.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("59eeb0fdbc0567de12aa46ef6a63bf10f109b08e52fc83995a446409f0b7faab")

build() {
  cd bazel-watcher-$pkgver
  bazel build //ibazel
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

