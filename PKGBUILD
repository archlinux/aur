# Maintainer: Wojciech Kepka <wojtek.kepka@protonmail.com>
pkgname=rustop-git
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="All important information about your system in one place"
arch=('x86_64' 'i686')
url="https://github.com/wojciechkepka/rustop"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
provides=("rustop")
conflicts=("rustop")
sha1sums=('SKIP')
source=("$pkgname::git+https://github.com/wojciechkepka/rustop")

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm644 "target/release/rustop" "$pkgdir/usr/bin/rustop"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
