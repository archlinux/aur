# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=bazelisk-bin
pkgver=1.14.0
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel'
url='https://github.com/bazelbuild/bazelisk'
conflicts=("bazel")
provides=('bazel')
license=('Apache')
arch=('x86_64')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/bazelisk/v${pkgver}/LICENSE"
  "bazelisk-linux-amd64-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '84e946ed8537eaaa4d540df338a593e373e70c5ddca9f2f49e1aaf3a04bdd6ca')

package() {
  install -D -m 644 \
    "${srcdir}/${source[0]%%::*}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m 755 \
    "${srcdir}/${source[1]%%::*}" \
    "${pkgdir}/usr/bin/${pkgname%isk-bin}"
}
