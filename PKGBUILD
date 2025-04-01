# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-bin
pkgver=3.41.0
pkgrel=2
pkgdesc="(DEPRECATED) This package has been renamed to 'qp'. Please install 'qp' instead."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Zweih/yaylog"
license=("MIT")
provides=("yaylog")
conflicts=("yaylog" "yaylog-git")
install='yaylog.install'

release_url="${url}/releases/download/v${pkgver}/yaylog-v${pkgver}"
ext=".tar.gz"

source_x86_64+=("${release_url}-x86_64${ext}")
source_aarch64+=("${release_url}-aarch64${ext}")
source_armv7h+=("${release_url}-armv7h${ext}")

sha256sums_x86_64=('1f5fe5969d16dcf7758fc02f0ee6050999e12f95438a90b6266498d1fff985fd')
sha256sums_aarch64=('00ff6ba394025c1a23096c9670deca6f2b05e628f790e8cb78faf90b15b42c8e')
sha256sums_armv7h=('ee9b33c0b416fc49bfad97d580815dd9392a65ce672f04a72019360ea7bad2b2')

package() {
  tar -xzf "$srcdir/yaylog-v${pkgver}-${CARCH}${ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/yaylog-${CARCH}" "$pkgdir/usr/bin/yaylog"
  install -Dm644 "${srcdir}/yaylog.1" "$pkgdir/usr/share/man/man1/yaylog.1"
}
