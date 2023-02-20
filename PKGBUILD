# Maintainer: Revincx <revincx233@gmail.com>

pkgname='kikoplay-bin'
pkgver=0.9.2
pkgrel=2
pkgdesc="linux danmaku player"
arch=('x86_64')
license=('GPL3')
url="https://github.com/KikoPlayProject/KikoPlay"
depends=('mpv' 'lua53' 'qhttpengine')
conflicts=('kikoplay')
optdepends=('aria2: for downloading')
source=(
   "https://github.com/KikoPlayProject/KikoPlay/releases/download/$pkgver/$pkgver.Linux.7z"
)
sha256sums=(
    "d7167aac6dc11453b99432263c2d6b92eb9751883aec42a25e6d8a23ab881123"
)

package() {
    cd "$srcdir/$pkgver(Linux)"
    install -Dm644 KikoPlay使用说明.pdf "$pkgdir/usr/share/doc/kikoplay/help.pdf"
    install -Dm755 KikoPlay "$pkgdir/usr/bin/KikoPlay"
    install -Dm644 kikoplay.png "$pkgdir/usr/share/pixmaps/kikoplay.png"
    install -Dm644 kikoplay.desktop "${pkgdir}/usr/share/applications/kikoplay.desktop"
    ln -sf KikoPlay "$pkgdir/usr/bin/kikoplay"
}
