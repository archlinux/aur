# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>

pkgname=easyeda-bin
pkgver=6.4.19.4
pkgrel=1
pkgdesc="easyeda.com desktop client"
arch=('x86_64')
url="https://easyeda.com/"
license=('unknown')
depends=()
makedepends=('unzip')
source=("https://image.easyeda.com/files/easyeda-linux-x64-${pkgver}.zip"
		"custom-dest-dir.patch")
md5sums=("d81e46d64728cc7fea725f0bf7e044a5"
		"bcf19d29779d81c21b57df4742e428df")

prepare() {
	patch "$srcdir/install.sh" "custom-dest-dir.patch"
}

package() {
	cd "$srcdir"
	sh install.sh "$pkgdir"
}
