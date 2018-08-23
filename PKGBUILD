# Maintainer: Sebastian Blunt <arch-packaging@c4k3.net>

pkgname="nbted"
pkgver="1.5.0"
pkgrel="1"
pkgdesc="Command line NBT editor"
arch=('i686' 'x86_64')
url="https://github.com/C4K3/nbted"
license=('custom:CC0')
makedepends=('rust' 'cargo')
source=("https://github.com/C4K3/nbted/archive/${pkgver}.tar.gz")
sha256sums=('13d9f7f4ab0db64ad0082fe5975715a693f6c26b336f35248fc1f584c8e4eb21')

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

