# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname='erg-git'
_pkgname="erg"
pkgver=0.2.6
pkgrel=1
pkgdesc="The Erg programming language"
url="https://github.com/erg-lang/erg"
license=('MIT' 'Apache')
arch=('x86_64')
conflicts=('erg-bin' 'erg')
depends=('python')
makedepends=('cargo' 'git')
source=("$_pkgname::git+https://github.com/erg-lang/erg.git")
sha256sums=("SKIP")

build() {
	cd $_pkgname/
	cargo build --release
}

package() {
	install -Dm755 "$_pkgname/target/release/erg" -t "$pkgdir/usr/bin"
	install -Dm644 $startdir/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 $startdir/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}