# Maintainer: Myles Bruteforce <myles_bruteforce at slmail dot me>
pkgname=gnome-shell-extension-order-icons-git
_pkgname=order-icons
_uuid='order-extensions@wa4557.github.com'
pkgver=r42.9be1082
pkgrel=1
pkgdesc="Gnome Shell extension for ordering icons in the top bar like for Ubuntu unity"
arch=('any')
url="https://github.com/andia89/order-icons"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/andia89/order-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo $revision
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"

  install -Dm644 $_uuid/extension.js -t "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 $_uuid/metadata.json -t "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 $_uuid/prefs.js -t "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 $_uuid/schemas/gschemas.compiled -t "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid/schemas"
  install -Dm644 $_uuid/schemas/org.gnome.shell.extensions.order-icons.gschema.xml -t "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
