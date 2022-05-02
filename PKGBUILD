# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.9.2
pkgrel=2
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	arm64) _pkgarch="arm64"
		sha512sums=('3772a9e45b038e1ea33e5d4a5a19c05a1856e14d2bb8c995bec014d5e705045b8067d549b518ced2c956d89125a519a80c7f49f7b6dc51ea5113434ea11c3845')
		;;
	x86_64) _pkgarch="amd64"
		sha512sums=('72d10cafa09dce073f0831dc2f454f6db7bdc801e8a86359a0fcfa7c652482bd66e96087683647263df24d667cccb5e1403f4836d6fc4cfbc6780dad3af365e4')
		;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
