# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgbase=yaylog-bin
pkgver=3.12.1
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/yaylog"
license=("MIT")
provides=("yaylog")
conflicts=("yaylog" "yaylog-git")

release_url="${url}/releases/download/v${pkgver}/yaylog-v${pkgver}"
ext=".tar.gz"

source_x86_64+=("${release_url}-x86_64${ext}")
source_aarch64+=("${release_url}-aarch64${ext}")
source_armv7h+=("${release_url}-armv7h${ext}")

sha256sums_x86_64=('da12c6a7ff8f334fa2fa49225c4aa75e06bf5d1f4d7e89c890d15fa7ae38216f')
sha256sums_aarch64=('df19c279a3a869a3f6d94b56cb9a353d3a2c9d474dfdf339c07fb7ae1707a653')
sha256sums_armv7h=('59b1048a968789c99bcee21796d06f9fc33c2d429497bc9bff7e5ceee6b35cfd')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
