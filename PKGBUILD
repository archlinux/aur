# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=whistle
pkgver=0.0.2
pkgrel=2
pkgdesc="A dope new programming language that still doesnt have a std library."
arch=('x86_64')
url="https://whistle.js.org/"
license=('MIT')
makedepends=('git' 'cargo')
source=("git+https://github.com/whistle-lang/whistle#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -Dm755 target/release/whistle "$pkgdir"/usr/bin/whistle

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
