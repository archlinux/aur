# Maintainer: YTG123 <54103478+YTG1234@users.noreply.github.com>
pkgname=fabricversions
pkgver=0.1.5
pkgrel=1
pkgdesc="Fetch FabricMC versions"
arch=("x86_64")
url=https://github.com/YTG1234/fabricversions
license=('GPL3')
depends=('curl' 'libxml2' 'gcc-libs' 'swift-language')
makedepends=('git' 'libedit')
options=('zipman')
changelog=CHANGELOG
source=("git+https://github.com/YTG1234/$pkgname?signed#tag=v$pkgver")
md5sums=('SKIP')
sha256sums=('SKIP')
validpgpkeys=('04DBDABBF85C4D4987116AE14B81184A270A28B5')

build() {
	cd "$pkgname"
	make NOZIPMAN=1
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/usr" NOZIPMAN=1 install
}
