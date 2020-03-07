# Maintainer: WhizSid <whizsid@aol.com>
pkgname=jsonapiunit
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="TypeScript like unit testing framework for testing REST JSON APIs."
url="https://github.com/whizsid/jsonapiunit"
license=('MIT')
source=('jsonapiunit::git+https://github.com/whizsid/jsonapiunit#tag=0.1.0')
md5sums=('SKIP')

build() {
    cd $pkgname
    cargo build --release --locked
}

package() {
    install -Dm 755 "$srcdir/$pkgname/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
