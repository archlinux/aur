# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=batify
pkgver=0.8
pkgrel=1
pkgdesc='Minimalist way to set battery level warnings using udev and libnotify (for X single-user system).'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('git' 'libnotify')
optdepends=('notification-daemon')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
