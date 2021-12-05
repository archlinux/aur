# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=11
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('735e29dafc2aad075628293f53ed5083eca8b7884294f117d766659150fe896681c466448703c23147be0dbdf75022708f5b394a6d2b2c240a7bb9c8243b3153')

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
