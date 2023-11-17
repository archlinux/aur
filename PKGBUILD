# Maintainer: Letu Ren <fantasquex@gmail.com>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=bazelisk-bin
pkgver=1.19.0
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel'
arch=('x86_64')
url='https://github.com/bazelbuild/bazelisk'
license=('Apache')
# https://github.com/bazelbuild/bazelisk#installation
# We should add both `bazelisk` and `bazel` to PATH
provides=('bazel' 'bazelisk')
conflicts=('bazel' 'bazelisk')
source=(
  "bazelisk-linux-amd64-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('d28b588ac0916abd6bf02defb5433f6eddf7cba35ffa808eabb65a44aab226f7')

package() {
  install -Dm755 "${srcdir}/bazelisk-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bazelisk"
  ln -s /usr/bin/bazelisk "${pkgdir}/usr/bin/bazel"
}

