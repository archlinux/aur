pkgname=cmdcreate
pkgver=1.1.7
pkgrel=1
arch=('any')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL3')
depends=('curl' 'nano' 'git' 'openssl')
makedepends=('cargo' 'git' 'rust')
pkgdesc="Allows you to create custom commands for your custom scripts"
source=("git+https://github.com/owen-debiasio/cmdcreate.git#tag=v$pkgver")
sha256sums=('SKIP')

conflicts=('cmdcreate-git' 'cmdcreate-git-debug')
options=('debug')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/cmdcreate "$pkgdir/usr/bin/cmdcreate"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
