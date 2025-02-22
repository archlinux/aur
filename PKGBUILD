# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgbase=yaylog-bin
pkgver=3.9.1
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

sha256sums_x86_64=('396db06874df7d71fea28638d96f0754c41b006f9a12cb7417e1cc6334c92fef')
sha256sums_aarch64=('4581bce2e27860586e80d491d9af23e9f22062f383812a46dca7f84510a23a89')
sha256sums_armv7h=('95f286d7d056206ed67bdaee1302b48af3b19551f0d5122635bb90f03c2a1889')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
