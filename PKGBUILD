# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.63.2
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=("07f839407142a692c12d22e31fc88aa9855940dacddeaa0a5f6fad27e1855e91")
sha256sums_aarch64=("ee5d694dc39e4f9ece8be25805d5755c317ebf599e3b078b68c511f48b9d63f3")
sha256sums_armv7h=("e3a8a9fb32d456152059e5bcf6485da1c00ffad2eb2dfef75d19ae036f95ff4c")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
