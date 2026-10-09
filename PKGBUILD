# Maintainer: Lecer69 <https://github.com/Lecer69>
pkgname=lssh
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple SSH server manager"
arch=('x86_64')
url="https://github.com/Lecer69/LSSH"
license=('Unlicense')
depends=('openssh' 'sshpass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Lecer69/LSSH/archive/v$pkgver.tar.gz")
sha256sums=('a6389296ea082ef4ea3e28360d03ca716a6d7fc4416777fbdf298844acc5b72c')

build() {
    cd "LSSH-$pkgver"
    cargo build --release
}

package() {
    cd "LSSH-$pkgver"
    install -Dm755 target/release/lssh "$pkgdir/usr/bin/lssh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lssh/README.md"
}
