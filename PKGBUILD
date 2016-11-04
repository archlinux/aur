# Maintainer: Josh Klar <j@iv597.com>
pkgname=silentarmy
pkgver=3.0.1
pkgrel=1
_gittarget='adea4e582a728438d6adaa4b4a41ef9645496062'
pkgdesc="GPU Zcash Equihash solver"
arch=('i686' 'x86_64')
url="https://github.com/mbevand/silentarmy"
license=('MIT')
groups=()
depends=('libcl' 'libsodium' 'opencl-headers')
source=("https://github.com/mbevand/silentarmy/archive/$_gittarget.tar.gz")
sha256sums=('32d31aaa69a18a08e113154e0eb1daf9f0f48f389cc6c10cce13a33bf286bc67')

build() {
	cd "$pkgname-$_gittarget"
	make
}

check() {
	cd "$pkgname-$_gittarget"
	make test
}

package() {
	cd "$pkgname-$_gittarget"
	mkdir -p "$pkgdir/usr/bin"
	install silentarmy "$pkgdir/usr/bin/"
	install sa-solver "$pkgdir/usr/bin/"
}
