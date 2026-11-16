# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu-bin
pkgver=0.3.6
pkgrel=4
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
sha256sums=(
    '78d1cf38154fe22b2a4b8071395ced8698df9e2e40223aa83476229bd8f2fe21'
    '428286cc99d8c2174d9747b210846e279dca074edee0fd0372af8fa7653816f9'
)
validpgpkeys=('42BE68F43D528467FC281E2E310FFE86A2E427BA')

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/wofi-power-menu"
}

