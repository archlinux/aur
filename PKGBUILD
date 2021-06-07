# Maintainer: Jan Ole Zabel <joz@spline.de>
# This package is not maintained by the author himself.
pkgname=doh-proxy
reponame=doh-server
pkgver=0.4.0
pkgrel=0
pkgdesc="A DNS-over-HTTP server proxy written in Rust by jedisct1"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/$reponame"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('1fffb5ac45b57d03896eab528fc2dffca10f5477b067315ee22b352bb99a4c43084ec06ca59d506cd4afcc113a7644200ae4f3d5ff0a1af129508910f96f6f2e')

build() {
	cd "$reponame-$pkgver"
	cargo build --release
}

package() {
	cd "$reponame-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

