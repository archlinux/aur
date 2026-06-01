pkgname=ivylink
pkgver=0.1.0
pkgrel=1
pkgdesc="Ivy's declarative dotfile manager and theme engine"
arch=('x86_64')
url="https://github.com/ivyella/ivylink"
license=('GPL-3.0-only')

depends=('gcc-libs')
makedepends=('cargo' 'git' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ivyella/ivylink/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c87cb0808d3a8321b62cac3e4b8e10d00f4d7b5886a3724d37f7ec51ca498d9')

build() {
    cd "$srcdir"/*/
    cargo build --release --locked
}

package() {
    cd "$srcdir"/*/

    install -Dm755 target/release/ivylink \
        "$pkgdir/usr/bin/ivylink"

    install -Dm644 LICENSE* \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
