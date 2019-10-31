# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=browser360
pkgver=10.0.2012.0
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
source=(
    "https://down.360safe.com/gc/browser360-cn-stable_$pkgver-${pkgrel}_amd64.deb"
)
sha512sums=(
    '4a4b5ca22c0728d8d0d74b10637e596595bbf973e2e7e17fc09be04d439bb24a5a08893bb4e4adf63cd5d24740aa95013147adb75085dc2ec3ae33c4dd76b4c6'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    rm -rf "$pkgdir/etc/"

    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir/opt/browser360/product_logo_${i/x*}.png" \
                       "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
        rm "$pkgdir/opt/browser360/product_logo_${i/x*}.png"
    done
}
