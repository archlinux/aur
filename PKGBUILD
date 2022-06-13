# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
		 sha512sums=('a9de27fac34eda0824ec986df4bdd0f9ec69059e82a9bfd928b0aff56da8dcf35029167b948e7ef86a353e701f76e2f89e167a9b587149447fc8c873124838e2')
		 ;;
	x86_64)  _pkgarch="amd64"
		 sha512sums=('6678ac3b7c8f6da527ecb0a40246c3aecb07e7161068a46d35b39e3edfc55cce60f57cbaa7df21dcfa65d6166d9c0a3f8c623398c141a708c04c100307b1a565')
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
