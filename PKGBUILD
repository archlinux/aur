# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog")

release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
ext=".tar.gz"

source_x86_64+=("${release_url}-x86_64${ext}")
source_aarch64+=("${release_url}-aarch64${ext}")
source_armv7h+=("${release_url}-armv7h${ext}")

sha256sums_x86_64=('2cd0cec9e1cfddd726e09ee6dfabf31a05ee9586c659e11cc46be6a59a4e5c93')
sha256sums_aarch64=('315b314607ce19e9d5dbb482624b1d1e6e23d85b0f8998fa71ca3035aa4dd5d3')
sha256sums_armv7h=('8c944c399e70cb9497b1175bedd9cb16d915f357a3aa45414065203d2bb6259b')

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "$pkgdir/usr/share/man/man1/qp.1"
}
