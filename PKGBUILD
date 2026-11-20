# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Highly configurable power menu using the wofi launcher power-menu (prebuilt binary)"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
provides=('wofi-power-menu')
conflicts=('wofi-power-menu')
source=(
    "${pkgname}-${pkgver}::$url/releases/download/v$pkgver/wofi-power-menu-linux-x64"
    "${pkgname}-${pkgver}.asc::$url/releases/download/v$pkgver/wofi-power-menu-linux-x64.asc"
)
sha256sums=('40f325e0404e2cac2e98295ecf15acc656895143ab1f4fa89ad704516d8c9139'
            'SKIP')
validpgpkeys=('42BE68F43D528467FC281E2E310FFE86A2E427BA')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/wofi-power-menu"
}

