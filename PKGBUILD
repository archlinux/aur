# Maintainer: mars <gzhqyz@gmail.com>
# Contributor: Jack Chen <redchenjs@live.com>
# Contributor: redchenjs <redchenjs@live.com>

pkgname=browser360
pkgver=12.2.1070.0
pkgrel=1
pkgdesc="360 Security Browser"
arch=('x86_64')
url="https://browser.360.cn/se/linux/"
license=('custom')
depends=(
    'alsa-lib'
    'gconf'
    'gtk2'
    'nss'
    'libxt'
    'libxss'
    'libxtst'
    'libglvnd'
)
source=("https://down.360safe.com/gc/browser360-cn-stable_$pkgver-${pkgrel}_amd64.deb")
sha512sums=('2da0e8e4475d9a27880ec9a5816112825243e31b3fb9010ad34d61790062cb4138bd1753d8699173d9ee3c8142a9704da86d6d46c87f0dbabc4c4ca7e04fc712')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    rm -rf "$pkgdir/etc/"

    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir/opt/browser360/product_logo_${i/x*}.png" \
                       "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname-cn.png"
        rm "$pkgdir/opt/browser360/product_logo_${i/x*}.png"
    done
}
