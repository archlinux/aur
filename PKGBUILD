# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>

pkgname=easyeda-bin
pkgver=6.4.7
pkgrel=2
pkgdesc="easyeda.com desktop client"
arch=('x86_64')
url="https://easyeda.com/"
license=('unknown')
depends=()
makedepends=('unzip')
source=("https://image.easyeda.com/files/easyeda-linux-x64-6.4.7.zip"
		"custom-dest-dir.patch")
md5sums=("d636a526483939f011f6724520317554"
		"bcf19d29779d81c21b57df4742e428df")

prepare() {
	patch "$srcdir/install.sh" "custom-dest-dir.patch"
}

package() {
	cd "$srcdir"
	sh install.sh "$pkgdir"
}
