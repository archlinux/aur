# Maintainer: Daniel Nägele <arch@danieln.de>
pkgname=bin-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A paste bin written in Rust. Github Release Binary."
arch=('x86_64')
url="https://github.com/w4/bin"
license=('WTFPL')
conflicts=('bin')
source=("https://github.com/w4/bin/releases/download/v1.0.2/bin-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz" 'bin.service')
sha256sums=('f8166e15d921bc8c67ae1c16777ea73dba4275197a9f1073645529ebe6f36a53'
    '4cb0c08af068637bb9c6330d41f34defc4173a863c2e2dd33f06fbffccfd80dc')

package() {
        cd "$srcdir"

        install -Dm644 bin.service "$pkgdir/usr/lib/systemd/system/bin.service"
        install -Dm755 bin "$pkgdir/usr/bin/bin"
}

