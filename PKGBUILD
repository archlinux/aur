# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=bazelisk-bin
pkgver=1.18.0
pkgrel=5
pkgdesc='A user-friendly launcher for Bazel'
arch=('x86_64')
url='https://github.com/bazelbuild/bazelisk'
license=('Apache')
# https://github.com/bazelbuild/bazelisk#installation
# We should add both `bazelisk` and `bazel` to PATH
provides=('bazel')
conflicts=('bazel' 'bazelisk')
source=(
  "bazelisk-linux-amd64-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('ce52caa51ef9e509fb6b7e5ad892e5cf10feb0794b0aed4d2f36adb00a1a2779')

package() {
  install -Dm755 "${srcdir}/bazelisk-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bazelisk"
  ln -s /usr/bin/bazelisk "${pkgdir}/usr/bin/bazel"
}

