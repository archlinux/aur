# Maintainer: creatorx <accelerate9 at gmail dot com>
pkgname=megit
pkgver=0.3.0
pkgrel=1
pkgdesc="A Git GUI repository manager based on EGit Eclipse plugin"
arch=('x86_64')
url="https://github.com/eclipsesource/megit"
license=('EPL2.0')
depends=('java-runtime>=11')
provides=('megit')
conflicts=('megit')
options=('!strip')
source=("https://github.com/eclipsesource/megit/releases/download/v$pkgver/com.eclipsesource.megit-linux.gtk.x86_64.zip"
        "megit.desktop"
        "egit.png")
sha256sums=('88be5477d7b6c1be7a377cebf29b591ef2d873c7b5ea54757decbaf15fae31b1'
            '2bd9fb226f4085f9c1b5c8e4d7b64a23f651539947d4239f8a7e29ea599c58be'
            '9f9ff6c58c752e2115057fdd7a25f7a085128dc3f8b8c2ac95adeb6e8c421b75')

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -a $srcdir/* "$pkgdir/opt/$pkgname"
    rm -r "$pkgdir/opt/$pkgname/com.eclipsesource.megit-linux.gtk.x86_64.zip"
    rm -r "$pkgdir/opt/$pkgname/megit.desktop"
    chmod -R 0755 "$pkgdir/opt/$pkgname"
    chmod +x "$pkgdir/opt/$pkgname/megit"
    install -Dm644 egit.png "$pkgdir/opt/$pkgname/egit.png"
    install -Dm755 megit.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
