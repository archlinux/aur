# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=9
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('750c64684b29a4731c95f18e90b24b14f0e279f01ae100ff6a7c33b1db4b06dc076fdf372a6a894a4dad7e80907468d8aa042c5dbf26fdca59ed2eb1f14ec29e')

build() {
  cd "$_pkgname-$pkgver"

  make build
}

package() {
  cd "$_pkgname-$pkgver"
  _uuid='flypie@schneegans.github.com'
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
