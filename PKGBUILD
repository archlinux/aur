#Created by dromi (arelange)
#Packaged by ryanvade 

pkgname=gnome-shell-extension-hibernate-status-git
pkgver=r11.e358c28
pkgrel=1
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
install=gnome-shell-extension-hibernate-status-git.install
source=("$pkgname::git+https://github.com/arelange/gnome-shell-extension-hibernate-status")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='hibernate-status@dromi'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "confirmDialog.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/confirmDialog.js"
}
