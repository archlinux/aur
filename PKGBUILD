# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.43.2
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
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

sha256sums_x86_64=("99593a0c673e5e5e6775ecd6e02f0af74dc61800e46384fb6ee6d2283eff156f")
sha256sums_aarch64=("61fcefd3eeeaa5860f1d8a0633907028630553a1d4db251c1ed79b9d3310affb")
sha256sums_armv7h=("a1bb3cb78c69c0b0e04cbab7338e417ecc7f1177472515d79dc2fdced30d630d")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
