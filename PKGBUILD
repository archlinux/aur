# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgver=3.26.1
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

sha256sums_x86_64=('a40bc0d79e11cd6117cb92f361cea85281c4b45dbb4afd68f07ba93383d15ab7')
sha256sums_aarch64=('5cdbd22d2d30b7524011f66f277d5841bf154bee6a8780f18ed3d403b3abe96e')
sha256sums_armv7h=('c7d4f84be902fa4ac5cf968549a2452a9d1fe40a962894ea1b1e5ea3818c515a')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
