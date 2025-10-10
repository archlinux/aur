# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Highly configurable power menu using the wofi launcher power-menu (prebuilt binary)"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
provides=('wofi-powert-menu')
conflicts=('wofi-powert-menu')
source=(
    "${pkgname}-${pkgver}::$url/releases/download/v$pkgver/wofi-power-menu-linux-x64"
    "${pkgname}-${pkgver}.asc::$url/releases/download/v$pkgver/wofi-power-menu-linux-x64.asc"
)
sha256sums=(
    'a758c541d63e9b417adaa3a27bdeca8309c6af01eae7d1e8732dc06aac85cd89'
    'ec7e47b6a30f342dc94ba826116f4cccd9cc563d2073bb167fe3679262a2bce1'
)
validpgpkeys=('42BE68F43D528467FC281E2E310FFE86A2E427BA')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/wofi-power-menu"
}

