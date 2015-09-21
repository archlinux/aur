# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=hyperfs
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple HTTP static file server"
arch=('i386' 'x86_64')
url="https://github.com/tmccombs/hyperfs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
provides=()
source=("https://github.com/bytecurry/hyperfs/archive/v$pkgver.tar.gz")
md5sums=('ae47cd66acf76c1b24c90acc50724a89')


build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/hyperfs "$pkgdir/usr/bin/hyperfs"
	install -D LICENSE "$pkgdir/usr/share/licenses/hyperfs/LICENSE"
}
