# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-hotkeys-popup
pkgver=4
pkgrel=1
pkgdesc="GNOME Shell Extension that displays currently configured Gnome hotkeys in a popup."
arch=('any')
url="https://github.com/mipmip/gnome-shell-extensions-hotkeys-popup"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('94c09831979cfc939bb00a5ea0fd5b8a4198f64e6688fb8b31cfcbbadab945f8b61f11c2d70414fc20af1753a4c55577c18c662577b4dcf6aab87f42548f9433')

build() {
  cd "$pkgname-$pkgver"

  ./install.sh zip
}

package() {
  _uuid='hotkeys-popup@pimsnel.com'
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
