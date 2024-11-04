# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=bazelisk-bin
pkgver=1.22.1
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel'
arch=('x86_64')
url='https://github.com/bazelbuild/bazelisk'
license=('Apache-2.0')
# https://github.com/bazelbuild/bazelisk#installation
# We should add both `bazelisk` and `bazel` to PATH
provides=('bazel' 'bazelisk')
conflicts=('bazel' 'bazelisk')
source=(
  "bazelisk-linux-amd64-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('8fede4d1fde801590d6e7cf919e705f740768d56ae38d55d473536714719af04')

package() {
  install -Dm755 "${srcdir}/bazelisk-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bazelisk"
  ln -s /usr/bin/bazelisk "${pkgdir}/usr/bin/bazel"
}

