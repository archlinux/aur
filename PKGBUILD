#Created by  eagleoneraptor
#Packaged by ryanvade 

pkgname=gnome-shell-extension-battery-percentage-git
pkgver=r4.414ae28
pkgrel=1
pkgdesc="This extension just shows the battery power remainging percentage at the panel."
arch=('any')
url="https://github.com/eagleoneraptor/battery-percentage-extension"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
install=gnome-shell-extension-battery-percentage-git.install
source=("$pkgname::git+https://github.com/eagleoneraptor/battery-percentage-extension")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='battery-percentage@nohales.org'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
}

