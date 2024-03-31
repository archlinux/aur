# Maintainer: exu <mrc+aur _a_ frm01 _d_ net>

pkgname=suwayomi-jui-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Suwayomi-Server instance.'
arch=('x86_64')
url='https://github.com/Suwayomi/Suwayomi-JUI'
license=('MPL2')
depends=("java-runtime>=17")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=("tachidesk-jui-bin")
source=("https://github.com/Suwayomi/Suwayomi-JUI/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('3b0dcbcc60e1f863488afa0e030f1576bc9ed3c0d70d4a486c1809d603a6223b')

package() {
    tar -xf data.tar.zst -C "$pkgdir"
    install -Dm644 "$pkgdir/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Suwayomi-JUI.desktop"  -t "$pkgdir/usr/share/applications/"
}

