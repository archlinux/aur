pkgname=bruh-shell
pkgver=1.1.2
pkgrel=1
pkgdesc="A minimal standalone shell that prints 'bruh' when a command fails"
arch=('x86_64' 'aarch64')
url="https://github.com/praneethashok14/bruh-shell"
license=('MIT')
depends=('sh')
makedepends=('cargo')
source=("https://github.com/praneethashok14/bruh-shell/archive/refs/tags/v1.1.2.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/bruh-shell-1.1.2"
    cargo build --release --locked
}

package() {
    cd "$srcdir/bruh-shell-1.1.2"
    install -Dm755 target/release/bruh "$pkgdir/usr/bin/bruh"
}
