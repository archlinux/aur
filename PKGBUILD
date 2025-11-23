# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=gnome-shell-extension-fly-pie
_pkgname=Fly-Pie
pkgver=32
pkgrel=1
pkgdesc='Fly-Pie is an innovative marking menu written as a GNOME Shell extension.'
arch=('any')
url='https://github.com/Schneegans/Fly-Pie'
license=('MIT')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6f9595b1cb2b8f8d069f7f699561dc8a6cdda053b085a16891c6369eecb4b0ecbbfbcf397a296636871e92a399471e797bae8fc064a21881163926c5f74df62c')

build() {
  cd "$_pkgname-$pkgver"

  make zip
}

package() {
  cd "$_pkgname-$pkgver"

  _uuid='flypie@schneegans.github.com'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  glib-compile-schemas "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
