# Maintainer: mars <gzhqyz@gmail.com>
# Contributor: Jack Chen <redchenjs@live.com>
# Contributor: redchenjs <redchenjs@live.com>

pkgname=browser360
pkgver=12.1.2000.0
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
sha512sums=('678419ecea2a4398ae0d2dcc4a717f593c1adbce40263b4ec1e080f89e8580d62ff945f227f6c8f74d8e652183f3db7bb34bc18ff0b5615b780d6f2cec2c060d')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    rm -rf "$pkgdir/etc/"

    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir/opt/browser360/product_logo_${i/x*}.png" \
                       "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname-cn.png"
        rm "$pkgdir/opt/browser360/product_logo_${i/x*}.png"
    done
}
