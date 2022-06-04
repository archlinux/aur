# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
		 sha512sums=('adf91884481ffd867d37da919ba11c8376a80e7b2904835aef8468f6353a47b21787202545330f10cd3d7b54606d30d9b12e4b27b2cd7d59c8d0971bddeb06e8')
		 ;;
	x86_64)  _pkgarch="amd64"
		 sha512sums=('e87eb39a086cfcdaa664e00460021d4027b1379b486fbddfe78c84ca3cee905ea0e714bfd1dc4568dfdf0c44ddb81b1e9b8b2bcf3741c6407de986c42bd9d906')
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
