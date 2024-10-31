# Maintainer: Jack Tench <jack at jtench dot co dot uk>
pkgname=minilaunch-git
_pkgname=minilaunch
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI game launcher."
arch=('x86_64')
url="https://github.com/JackTench/minilaunch"
license=('GPL3')
depends=(
	'rust'
	'cargo'
)
makedepends=('cargo')

source=("$_pkgname::git+https://github.com/JackTench/minilaunch.git")
sha256sums=('SKIP')

build() {
	cd $_pkgname
	cargo build --release --locked
}

package() {
	cd $_pkgname
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/minilaunch"
}
