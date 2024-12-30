# Contributor: Maximilian Edison <maximilianedison at gmail dot com>
# Contributor: Max Base <maxbasecode at gmail dot com>

pkgname="ssh_system_finder"
pkgver="1.0.0"
pkgrel=2
pkgdesc="Scan an IP or local network and identify systems that have SSH enabled."
arch=('x86_64')
url="https://github.com/basemax/sshfinderc"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
source=("git+$url.git#commit=bcd2744794c1ac30587c0809b9acf7d8d83f6169")
sha512sums=('75df1fe51d7c58b67c1ebd4ddc165cda1306db6da10cfffb784073556af7e157c9c2bc3c1eea620a5b5ab4381423c224a8cc4a7b62fe1effa9a169a15967f16d')

build() {
    cd "sshfinderc"
    make
}

package() {
    cd "sshfinderc"
    install -Dm755 "ssh_system_finder" "$pkgdir/usr/bin/ssh_system_finder"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
