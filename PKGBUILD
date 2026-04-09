# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager-bin
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.18 # renovate: datasource=github-tags depName=arviceblot/eso-addons
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
  "com.arviceblot.eso-addon-manager.png::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/data/icon.png"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/arviceblot/eso-addons/refs/tags/v${pkgver}/LICENSE"
  "com.arviceblot.eso-addon-manager.desktop"
)
sha256sums=('e1a7779e4f8880ecc4bf306af66c2a764136d243d2c0f408b1764b8e61a8b0d2'
            '0a085ba27dc72ae85eaf2033c8099ce01e737b680f6313e28253d6eb49e0e284'
            '8e53babd1d2c750bcee57c8489cbb58602541f7bc1f4077cec919234246f6ea9'
            '4fc6d1df6ca640527e1f7a2e7718d487cd1d5677785724b0803c76ef8e466e5e')

package() {
  install -Dm755 "$srcdir/eso-addon-manager-$pkgver" "$pkgdir/usr/bin/eso-addon-manager"
  install -Dm644 "$srcdir/com.arviceblot.eso-addon-manager.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.arviceblot.eso-addon-manager.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file is no longer provided by the repository, so we provide our own based on a older version from source:
  # https://github.com/arviceblot/eso-addons/blob/9d29dbd588190646b55b9c7281dc3bae80aa10ae/data/com.arviceblot.eso-addon-manager.desktop
  install -Dm644 "$srcdir/com.arviceblot.eso-addon-manager.desktop" "$pkgdir/usr/share/applications/com.arviceblot.eso-addon-manager.desktop"
}
