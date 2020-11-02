# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.14.0"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel" "git" "python")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("dc2a34dd6d63b36297579762b5df036a5b05530e7958e402345124b4ff3d14fd")

build() {
  cd bazel-watcher-$pkgver
  bazel build //ibazel
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

