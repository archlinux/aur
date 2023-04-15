# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-fly-pie
_pkgname=Fly-Pie
pkgver=19
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('615b9283f6d1c1efa111ff224559c7b40d0b0c0447c2fb455a7b5165ad6c695a067b0de579c62453dd2ed71fe904e1dd70a31552abc136e740519287ba36bf7c')

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
