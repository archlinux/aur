# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=hyperfs
pkgver=3.0.1
pkgrel=1
pkgdesc="A simple HTTP static file server"
arch=('i386' 'x86_64')
url="https://github.com/tmccombs/hyperfs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
provides=()
source=("https://github.com/bytecurry/hyperfs/archive/v$pkgver.tar.gz")
b2sums=('c79d1026057c2b54e6e8179ae822ef9d742f93cac3613a055ba96025275efd63c0f6752ff24b557f97dca8b30687f76fa437d6056c628c1ebc1aeb6fbf82e86f')



build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/hyperfs "$pkgdir/usr/bin/hyperfs"
	install -D LICENSE "$pkgdir/usr/share/licenses/hyperfs/LICENSE"
}
