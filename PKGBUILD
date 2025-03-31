# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgver=3.41.0
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

sha256sums_x86_64=('c278960d6eb03eecde783caf4c9252fb1f5b44c35dd6a36baa629635a0faa20f')
sha256sums_aarch64=('5a3aeee17b640a88141850fc4b22d6a7a7ddb3ef8f5353f562dd70455640eaa8')
sha256sums_armv7h=('9831bbb7499f0a1225454bb1d523bd67080347bdbd60eae2fda8d582aab3f2ac')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
