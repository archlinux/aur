# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=4.1.3
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=('yaylog' 'yaylog-bin' 'yaylog-git')

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=('db2cb9e261311073e9a88f4b5442f32ea6a281be9bb5318d631717c750a7c61d')
sha256sums_aarch64=('9e7f8ed26123768bcace93cc1d800ade9464764706a215a4a59f9a1af611e866')
sha256sums_armv7h=('b3fe1c9e6745ef9be92dfd34d64dea74f94d27cbd5b774bbc6f3de54640e4d3a')

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "$pkgdir/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "$pkgdir/usr/share/doc/${pkgname}/NEWS"
}
