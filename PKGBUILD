# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple SSH server manager"
arch=('x86_64')
url="https://github.com/Lecer69/LSSH"
license=('Unlicense')
depends=('openssh' 'sshpass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/LSSH/archive/v$pkgver.tar.gz")
sha256sums=('aeb3a3df778e87400da67238c9d25119297531fa9ca71b3ba3d89911834ccabb')

build() {
    cd "LSSH-$pkgver"
    cargo build --release
}

package() {
    cd "LSSH-$pkgver"
    install -Dm755 target/release/lssh "$pkgdir/usr/bin/lssh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lssh/README.md"
}
