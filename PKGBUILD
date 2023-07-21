# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=bazel-buildtools
pkgver=6.1.2
pkgrel=1
pkgdesc="A bazel BUILD file formatter and editor"
arch=('x86_64')
url='https://github.com/bazelbuild/buildtools'
license=('Apache')
makedepends=("bazel")

source=("bazel-buildtools-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('977a0bd4593c8d4c8f45e056d181c35e48aa01ad4f8090bdb84f78dca42f47dc')

build() {
  cd $srcdir/buildtools-$pkgver
  bazel build //buildifier //buildozer //unused_deps
}

package() {
  cd $srcdir/buildtools-$pkgver
  install -Dm755 -t $pkgdir/usr/bin ./bazel-bin/buildifier/buildifier_/buildifier ./bazel-bin/buildozer/buildozer_/buildozer ./bazel-bin/unused_deps/unused_deps_/unused_deps
}

