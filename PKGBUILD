# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu-bin
pkgver=0.3.3
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
    '86fc1b4d5be77c39a21f26eab49206d808367b67b3831f6ed130cbb1f9813ffb'
    '6e25c56d9145b637012d02c86e2a0f89ab43578f0e956c69f11f564912e0180b'
)
validpgpkeys=('42BE68F43D528467FC281E2E310FFE86A2E427BA')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/wofi-power-menu"
}

