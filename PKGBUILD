# Maintainer: jhideki
pkgname='pywal-spicetify'
pkgver=0.1.1
pkgrel=4
pkgdesc="Apply wal colors to spicetify"
arch=('x86_64')
url="https://github.com/jhideki/pywal-spicetify"
license=('MIT')
depends=('python-pywal16' 'spicetify-cli')
makedepends=('cargo' 'git')
source=("${pkgname}::git+https://github.com/jhideki/pywal-spicetify#tag=${pkgver}")
sha256sums=('SKIP')
options=('strip' '!debug')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --bin $pkgname
}

package() {
	cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    strip --strip-all "$pkgdir/usr/bin/$pkgname"
}
