# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.11.0"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("81370a6e198df5ec95b11a4f3cc8f025a844401742908e740bca94d14bcbad27")

build() {
  cd bazel-watcher-$pkgver
  bazel build //ibazel
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

