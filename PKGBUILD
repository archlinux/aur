# Maintainer Justin Buchanan <justbuchanan@gmail.com>

pkgname=ibazel-git
pkgver=master
pkgrel=2
pkgdesc='Tool for building Bazel targets when source files change.'
arch=('i686' 'x86_64')
url=https://github.com/bazelbuild/bazel-watcher
license=('Apache 2.0')
depends=('bazel')
source=("bazel-watcher::git+$url#branch=$pkgver")
sha512sums=('SKIP')

build() {
  cd bazel-watcher
  bazel build //cmd/ibazel
}

package() {
  cd bazel-watcher
  install -Dm755 bazel-bin/cmd/ibazel/*/ibazel "$pkgdir"/usr/bin/ibazel
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/ibazel/LICENSE
}
