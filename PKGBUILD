# Maintainer: Michael Hupf <michihupf at protonmail dot com>
_pkgname=gamevox-launcher
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice Chat built for gamers."
arch=('x86_64')
url="https://www.gamevox.com/"
license=('custom')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'gst-plugins-bad')
source=("https://gamevox-release-prod.s3.amazonaws.com/launcher/linux/gamevox-launcher")
sha256sums=('62b00d026c06c2d99abc7673fe873731b1f0675f7391f707b3f846f777519c51')
install=$pkgname.install

prepare() {
    chmod +x "$srcdir/$_pkgname"
}

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
