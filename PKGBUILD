# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgbase=yaylog-bin
pkgver=3.10.0
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

sha256sums_x86_64=('c307a3b1b9798830006aeae40bad79c6cbcc90a2870d5bd04c216eacc89a626d')
sha256sums_aarch64=('933fc00d415827e2a8b3aee7ac8590ca9f88c01944b0add1d36845943ac9545c')
sha256sums_armv7h=('5fb5e1abe6c53b857ad251279567efa57989f8842524fef51c654185a7b4f100')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
