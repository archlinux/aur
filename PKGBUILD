# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple SSH server manager"
arch=('x86_64')
url="https://github.com/Lecer69/LSSH"
license=('Unlicense')
depends=('openssh' 'sshpass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/LSSH/archive/v$pkgver.tar.gz")
sha256sums=('26bb4df2091ea445d3cbc9c646e6b9f8e69d6b5e8c1377c37446aee33e1132a1')

build() {
    cd "LSSH-$pkgver"
    cargo build --release
}

package() {
    cd "LSSH-$pkgver"
    install -Dm755 target/release/lssh "$pkgdir/usr/bin/lssh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lssh/README.md"
}
