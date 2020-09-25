# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Jack Chen <redchenjs@live.com>
# Contributor: redchenjs <redchenjs@live.com>

pkgname=browser360
pkgver=10.2.1006.19
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
sha256sums=('d22c4f95d63fc587f54000a56dbc62cd28473bf1aecba5056176b8d00cc74c0f')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  rm -rf "$pkgdir/etc/"

  for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$pkgdir/opt/browser360/product_logo_${i/x*}.png" \
                  "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname-cn.png"
    rm "$pkgdir/opt/browser360/product_logo_${i/x*}.png"
  done
}
