# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.13.1"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel" "python")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("48e1a9172805af1c8ae469f4289f86bdaa9914b6c4533c17c87fe9c475fe368a")

build() {
  cd bazel-watcher-$pkgver
  bazel build //ibazel
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

