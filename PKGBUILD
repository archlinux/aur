# Maintainer: Sung Pae <self AT sungpae DOT com>
pkgname=ffox-remote
_commit='b936fe94248eb084883211289020e1c1d43f6a71'
pkgver="20141024.$_commit"
pkgrel=1
pkgdesc='Lightweight remote control for Unix Firefox'
arch=('x86_64')
url="https://github.com/siebenmann/ffox-remote"
license=('unknown')
depends=('glibc')
makedepends=('go')
source=("https://github.com/siebenmann/ffox-remote/archive/$_commit.zip")
sha512sums=('043c5983b21ea59b341a0acfc55e44a6ca9f8c62ec677eca255421cc4891c0385fe75acaa7a53cdc8a559734cd7779fade931cc96fc632c3ece49b43117f7d67')

build() {
    cd "$pkgname-$_commit"
    go build -buildmode=pie -o "$pkgname"
}

package() {
    cd "$pkgname-$_commit"
    install -m 0755 -D -t "$pkgdir/usr/bin" "$pkgname"
}
