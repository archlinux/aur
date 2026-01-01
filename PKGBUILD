pkgname=cmdcreate
pkgver=0.9.5
pkgrel=1
arch=('x86_64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL-2.0-only')
depends=('curl' 'nano')
makedepends=('cargo' 'git' 'rust')
pkgdesc="Allows you to create custom commands for your custom scripts"
source=("git+https://github.com/owen-debiasio/cmdcreate.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/cmdcreate "$pkgdir/usr/bin/cmdcreate"
}
