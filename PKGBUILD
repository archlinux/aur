# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=('yaylog' 'yaylog-bin' 'yaylog-git')

release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
ext=".tar.gz"

source_x86_64+=("${release_url}-x86_64${ext}")
source_aarch64+=("${release_url}-aarch64${ext}")
source_armv7h+=("${release_url}-armv7h${ext}")

sha256sums_x86_64=('2dba7713a58c02b6965f3928763b8c09aaa40f5d3cc4e32733d404de4ad76da0')
sha256sums_aarch64=('2ecbb1c457278876e4f73b1deb9978473a95632479a7795dd5e2bcbc609bbc3e')
sha256sums_armv7h=('8c5839dfec188bdd47a1fa3d2c579c191eab32bb2312aa3dfd404f156df1f0a4')

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "$pkgdir/usr/share/man/man1/qp.1"
}
