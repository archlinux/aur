# Maintainer: BrunoPT <bruno.fl.jesus at gmail dot com>
pkgname=megit
pkgver=0.7.0
pkgrel=1
pkgdesc="A Git GUI repository manager based on EGit Eclipse plugin"
arch=('x86_64')
url="https://github.com/eclipsesource/megit"
license=('EPL2.0')
provides=('megit')
conflicts=('megit')
options=('!strip')
source=("https://github.com/eclipsesource/megit/releases/download/v$pkgver/megit-$pkgver-linux.gtk.x86_64.tar.gz"
        "megit.desktop"
        "egit.png")
sha256sums=('ea4549ebae2631e473320450ab099d711035e4091df646b3124a0ca5b60fe078'
            '2bd9fb226f4085f9c1b5c8e4d7b64a23f651539947d4239f8a7e29ea599c58be'
            '9f9ff6c58c752e2115057fdd7a25f7a085128dc3f8b8c2ac95adeb6e8c421b75')

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -a $srcdir/MeGit/* "$pkgdir/opt/$pkgname"
    chmod -R 0755 "$pkgdir/opt/$pkgname"
    chmod +x "$pkgdir/opt/$pkgname/megit"
    install -Dm644 egit.png "$pkgdir/opt/$pkgname/egit.png"
    install -Dm755 megit.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
