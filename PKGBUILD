# Maintainer: jhideki 
pkgname='pywal-spicetify'
pkgver=0.1
pkgrel=1
pkgdesc="Apply wal colors to spicetify"
arch=('x86_64')
url="https://github.com/jhideki/pywal-spicetify"
license=('MIT')
depends=('python-pywal' 'spicetify-cli')
makedepends=('cargo' 'git')
source=("${pkgname}::git+https://github.com/jhideki/pywal-spicetify#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
	cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
