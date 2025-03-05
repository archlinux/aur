# Maintainer: Ananas <ananas[at]ananas.moe>

_pkgname=aeternum
pkgname=aeternum-bin
_pkgver="v0.1.0"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A simple and minimal upscaler built in 🦀 rust (WIP)"
url="https://github.com/cloudy-org/aeternum"
license=(GPL-3.0-only)
provides=("aeternum")
conflicts=("aeternum")
arch=("x86_64")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/cloudy-org/aeternum/releases/download/$_pkgver/aeternum-x86_64-unknown-linux-gnu.tar.gz"
    "aeternum.png::https://raw.githubusercontent.com/cloudy-org/aeternum/refs/heads/main/assets/image.png"
    "aeternum.desktop::https://raw.githubusercontent.com/cloudy-org/aeternum/refs/heads/main/assets/aeternum.desktop"
    "aeternum.sh"
)
sha256sums=(
    '1f02557d479f5342c7a9ff297abe5b4db258b2db802bd6a7df7ec3490b66cf14'
    'e73098afa4349045265c87816eab4332ad9485af22cd43cd0d88aee80fc16a5e'
    'efa05c7a50e8aaaace89757dce2c8025a980c2a525197be5f992971695963d8b'
    '8088666b5cca28a0660b8ba844990d3211e949f879f4324a31e7194ebea648ea'
)

package() {
    install -dm755 $pkgdir/opt/aeternum

    cd $srcdir

    mv aeternum $pkgdir/opt/aeternum
    mv upscayl-bin $pkgdir/opt/aeternum
    mv models $pkgdir/opt/aeternum

    install -Dm755 aeternum.sh "$pkgdir/usr/bin/aeternum"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 aeternum.desktop "$pkgdir/usr/share/applications/aeternum.desktop"
    install -Dm644 aeternum.png "$pkgdir/usr/share/pixmaps/aeternum.png"
}