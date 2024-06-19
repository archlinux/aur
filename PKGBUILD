# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64' 'aarch64')
url="https://github.com/bdd/runitor"
license=('0BSD')

case "$CARCH" in
	aarch64) _pkgarch="arm64"
		 sha512sums=('8b945a85f18c5374a51bbab0c4ee4c8ba4df78dc8ae4726fe24c851842bd15ad36297694fb9e23c2ae59560c1c931bc534af79a1e92970d62844ba9ed4c63fcc')
		 ;;
	x86_64)  _pkgarch="amd64"
		 sha512sums=('74f746d01cb0bf4bc23442dbece16ce9228244b270bfe788e5bd69835b332a286141dcef263f29503eeec4c95298d0ea33a006c0c7e195ac3f87fbfa39ff5b6e')
		 ;;
esac

source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-${_pkgarch}")

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-${_pkgarch} $pkgdir/usr/bin/runitor
}
