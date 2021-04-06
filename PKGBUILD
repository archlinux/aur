# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Jack Chen <redchenjs@live.com>
# Contributor: redchenjs <redchenjs@live.com>

pkgname=browser360
pkgver=10.4.1005.66
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
source=("https://down.360safe.com/gc/browser360-cn-stable_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('ad51d9400ab6fb547de8e17c7ec00c9f59030b4c32392fa78db931fcbf7361de')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  rm -rf "$pkgdir/etc/"

  for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$pkgdir/opt/browser360/product_logo_${i/x*}.png" \
                  "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname-cn.png"
    rm "$pkgdir/opt/browser360/product_logo_${i/x*}.png"
  done
}
