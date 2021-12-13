# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=12
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('38c161f48cd0b373504ad615fd30669057a7d751ccd5abd6670fcbe24b6fa1dbf4aa3c6e8a56b696ea82f05d434c1be05b5ef40a452fde520e69d56172348552')

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
