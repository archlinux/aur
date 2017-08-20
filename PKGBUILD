# Maintainer: Sebastian Blunt <arch-packaging@c4k3.net>

pkgname="nbted"
pkgver="1.4.1"
pkgrel="1"
pkgdesc="Command line NBT editor"
arch=('i686' 'x86_64')
url="https://github.com/C4K3/nbted"
license=('custom:CC0')
makedepends=('rust' 'cargo')
source=("https://github.com/C4K3/nbted/archive/${pkgver}.tar.gz")
sha256sums=('852b853483ee4ff8daf0ddd47bd2fbb1c5323cb0a23287b9ae1b6cec5f1b5fa9')

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

package() {
	cd $pkgname-$pkgver
	install -Dm0755 target/release/nbted "$pkgdir/usr/bin/nbted"
	install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 nbted.1 "$pkgdir/usr/share/man/man1/nbted.1"
}

