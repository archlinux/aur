# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.1.1
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v0.1.1/gophish_linux_32bit.tar.gz")
md5sums_i686=("adbdbeb7fb5206d5a2c6fa037fa31524")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v0.1.1/gophish_linux_64bit.tar.gz")
md5sums_x86_64=("b627e109325276bd2dcbb83de222da1d")
source=("gophish.install"
	"gophish.service")
md5sums=("3419fb58467ad17a183ce82eefe1e4c3"
	 "3cd34a26874092746a0c5b45d684a341")
package() {
	mkdir -p ${pkgdir}/opt/gophish
	case "$CARCH" in
		i686) cp -r ${srcdir}/gophish_linux_386/* ${pkgdir}/opt/gophish ;;
		x86_64) cp -r ${srcdir}/gophish_linux_amd64/* ${pkgdir}/opt/gophish ;;
	esac
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}
