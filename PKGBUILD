# Maintainer: Sebastian Blunt <arch-packaging@c4k3.net>

pkgname="nbted"
pkgver="1.3.1"
pkgrel="1"
pkgdesc="Command line NBT editor"
arch=('i686' 'x86_64')
url="https://github.com/C4K3/nbted"
license=('custom')
makedepends=('rust' 'cargo')
source=("https://github.com/C4K3/nbted/archive/${pkgver}.tar.gz")
md5sums=('26167d796afa05bab7901878d4e46293')

build() {
	cd $pkgname-$pkgver
	cargo build --release
}

package() {
	cd $pkgname-$pkgver
	install -Dm0755 target/release/nbted "$pkgdir/usr/bin/nbted"
	install -Dm0644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 nbted.1 "$pkgdir/usr/share/man/man1/nbted.1"
}

