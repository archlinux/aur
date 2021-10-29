# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-fly-pie
_pkgname=Fly-Pie
pkgver=8
pkgrel=1
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('make' 'zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ff6a3ddfde4d5f301f550c3c1e19f6dbabc4dc06809458fd2c9dbe4f6f2d5b5b715f4ac8af23d39b1e02dd4e5721602e6d41842890e07d77582114db668f2c07')

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
