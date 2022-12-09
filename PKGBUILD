# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
		 sha512sums=('612ddb598227b41d2465713a2a7f50ab125c4eafe56f893290ddf9b1287db4547d5a08db68536af9d3b4ea0ae625baafa1eaf3a6ba8e41bfdf7449e79b86dd02')
		 ;;
	x86_64)  _pkgarch="amd64"
		 sha512sums=('8800d3402ac23f88636d5b137d564401c6fe5f4b127eb3d029b02d5f6bc25d50a3f029ccfc36965d07a78280d365d204bb1ab9a41950ea49add10f3af6a96419')
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
