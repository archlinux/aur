# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

pkgname=bazelisk-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A user-friendly launcher for Bazel"
url="https://github.com/bazelbuild/bazelisk"
conflicts=('bazel')
provides=('bazel')
license=('Apache 2.0')
arch=('x86_64')
source=(
  "https://raw.githubusercontent.com/bazelbuild/bazelisk/v${pkgver}/LICENSE"
  "bazelisk-linux-amd64-${pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${pkgver}/bazelisk-linux-amd64"
)
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '76c3af8cfe19f287b532990296bb58f02074d388856256b45a5f51bdbd196657')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "${srcdir}/${source[1]%%::*}" "${pkgdir}/usr/bin/${pkgname%isk-bin}"
}
