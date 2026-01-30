# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager-bin
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.13
pkgrel=1
arch=('x86_64')
url="https://github.com/arviceblot/eso-addons"
license=('MIT')
provides=('eso-addons-manager')
conflicts=('eso-addons-manager')
depends=(
  glibc
  gcc-libs
)

source=(
  "eso-addon-manager-$pkgver::https://github.com/arviceblot/eso-addons/releases/download/v${pkgver}/eso-addon-manager-x86_64-unknown-linux-gnu"
  "com.arviceblot.eso-addon-manager.desktop::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/data/com.arviceblot.eso-addon-manager.desktop"
  "com.arviceblot.eso-addon-manager.svg::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/data/com.arviceblot.eso-addon-manager.svg"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
  "f6f675d92d3e9a9999348a42694124e3b0e57d5089c494cb691d137d5829aa29"
  "62a4d8f8c71ce468ac124f48e906eee8d77bcf0240801b5ed9c4ee13d5f03601"
  "65f9e8e60e0f5806f50b117e838f432502e44313d5def6bab4e13c1f64d347e5"
  "8e53babd1d2c750bcee57c8489cbb58602541f7bc1f4077cec919234246f6ea9"
)

package() {
    install -Dm755 "$srcdir/eso-addon-manager-$pkgver" "$pkgdir/usr/bin/eso-addon-manager"
    install -Dm644 "$srcdir/com.arviceblot.eso-addon-manager.desktop" "$pkgdir/usr/share/applications/com.arviceblot.eso-addon-manager.desktop"
    install -Dm644 "$srcdir/com.arviceblot.eso-addon-manager.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.arviceblot.eso-addon-manager.svg"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}