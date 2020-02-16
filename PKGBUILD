# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver="0.11.2"
pkgrel="1"
pkgdesc="Tool for building Bazel targets when source files change."
arch=("i686" "x86_64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("bazel")
depends=("bazel")

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("7a262d38807617aff8e3c959d162023b2f0cdcc7c7b71749dcfe87d4631ef240")

build() {
  cd bazel-watcher-$pkgver
  bazel build //ibazel
}

package() {
  cd bazel-watcher-$pkgver
  install -Dm755 bazel-bin/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}

