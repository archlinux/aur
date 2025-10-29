# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu-bin
pkgver=0.3.2
pkgrel=2
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
    'b55515184e2b684cc3b18e392112c0e0cd90ad4c7f26a41d50024bb82594823e'
    '34d2522130cefc5b4414f2427d8bffba3ea840ddffc97dd762789610af305ece'
)
validpgpkeys=('42BE68F43D528467FC281E2E310FFE86A2E427BA')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/wofi-power-menu"
}

