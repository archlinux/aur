# Maintainer: irmluity <45vw4yz8g@mozmail.com>
# Maintainer: d6k283tix <d6k283tix@mozmail.com>

pkgname=bitcomet
pkgver=2.8.1
pkgrel=1
pkgdesc="A BitTorrent/HTTP/FTP download client"
arch=(x86_64)
url='https://www.bitcomet.com'
license=('LicenseRef-bitcomet')
depends=('webkit2gtk')
source=(
    "BitComet-${pkgver}-${CARCH}.deb::https://download.bitcomet.com/linux/x86_64/BitComet-2.8.1-x86_64.deb"
    "LICENSE.html::https://www.bitcomet.com/en/license"
)
sha256sums=(
    "747a34b098be10f2f4741bef83703738c1cce8c077ff8f671cce791a41bcfe5d"
    "SKIP"
)

prepare() {
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
    install -d $pkgdir/usr
    cp -r $srcdir/usr/ $pkgdir/
    install -Dm644 "$srcdir/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
