# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=17
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('40e84ca37853cb9fda97a04a0b13ee5f17f0d8361293a31779887e6b53a5ec22a8e792ce5331fe19af5580dc2aaae598e4d0a6e24ed5c3f4d5b8e0838c8c7a32')

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
