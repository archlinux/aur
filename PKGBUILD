# Maintainer: Ananas <ananas[at]ananas.moe>

_pkgname=aeternum
pkgname=aeternum-bin
_pkgver="v0.1.2-beta.1"
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
    "aeternum.png::https://raw.githubusercontent.com/cloudy-org/aeternum/refs/heads/main/assets/crystal.png"
    "aeternum.desktop::https://raw.githubusercontent.com/cloudy-org/aeternum/refs/heads/main/assets/aeternum.desktop"
    "aeternum.sh"
)
sha256sums=(
    '133101eae145de36cd38f354abe7e8a4d30138644ae09f98c6abaaf586bb6a4e'
    'f85a991b69b44c0a4eeaca2b0f3384831354da565b2d6bc1790a1e4451c6f70f'
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