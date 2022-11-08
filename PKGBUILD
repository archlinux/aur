# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hotkeys-popup
_pkgname=gnome-shell-extensions-hotkeys-popup
pkgver=4
pkgrel=1
pkgdesc="GNOME Shell Extension that displays currently configured Gnome hotkeys in a popup."
arch=('any')
url="https://github.com/mipmip/gnome-shell-extensions-hotkeys-popup"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('590b114b39498fc12e38fd57847538062e4daa9ae0a078eccac63c069fbea28a3a56dc2a2c18481644b85d8f46476c0149376299803ed8b1ac7e51f93216d72d')

build() {
  cd "$_pkgname-$pkgver"

  ./install.sh zip
}

package() {
  _uuid='hotkeys-popup@pimsnel.com'
  cd "$_pkgname-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
