# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=16
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('3d286d634d15953f7f98ea90b78b20856110e6cf3e3c074b52fa1c53930c1efa12fe0112fe1724112f77f3549ba51101a065cfdd00803a64e4f304af9546baf8')

build() {
  cd "$_pkgname-$pkgver"

  make zip
}

package() {
  cd "$_pkgname-$pkgver"
  _uuid='flypie@schneegans.github.com'
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
