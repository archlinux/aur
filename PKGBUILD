# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=gnome-shell-extension-fly-pie
_pkgname=Fly-Pie
pkgver=27
pkgrel=1
pkgdesc='Fly-Pie is an innovative marking menu written as a GNOME Shell extension.'
arch=('any')
url='https://github.com/Schneegans/Fly-Pie'
license=('MIT')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('efb3b9b324f4d9285a2789640df66de3876d93708d2b93e764cb7d7c0f6ec34cdf78efdb6ff25bb91283372f3f019e49fe918e36d9204cff39f8e8649fdbe91f')

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
