# Maintainer: YTG123 <54103478+YTG1234@users.noreply.github.com>
pkgname=fabricversions
pkgver=0.1.3
pkgrel=1
pkgdesc="Fetch FabricMC versions"
arch=("x86_64")
url=https://github.com/YTG1234/fabricversions
license=('MIT')
depends=('curl' 'libxml2' 'gcc-libs')
makedepends=('swift-language' 'git' 'libedit')
changelog=CHANGELOG
source=("git+https://github.com/YTG1234/$pkgname?signed#tag=v$pkgver")
md5sums=('SKIP')
sha256sums=('SKIP')
validpgpkeys=('04DBDABBF85C4D4987116AE14B81184A270A28B5')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
