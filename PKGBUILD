# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Foivos S. Zakkak <foivos at zakkak dot net>

pkgname=gnome-shell-extension-workspace-grid-git
pkgver=1.6.0.r212.d20f11a
pkgrel=1
pkgdesc="Allows to configure your workspaces in a grid"
arch=(any)
url="https://github.com/zakkak/workspace-grid"
license=('GPL3')
depends=('gnome-shell')
replaces=('gnome-shell-extension-workspace-grid')
makedepends=('git')
source=("$pkgname::git+https://github.com/zakkak/workspace-grid#branch=3.30")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "1.6.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname/src"
  _uuid='workspace-grid@mathematical.coffee.gmail.com'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "utils.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/utils.js"
  install -m644 "convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/convenience.js"
  install -m644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  install -m644 "prefKeys.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefKeys.js"
  install -m644 "version.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/version.js"
  install -m644 "stylesheet.css" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/stylesheet.css"
  install -m644 "ws-switch-arrow-left.png" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/ws-switch-arrow-left.png"
  install -m644 "ws-switch-arrow-right.png" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/ws-switch-arrow-right.png"
  install -m644 "gridWorkspaceSwitcherPopup.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/gridWorkspaceSwitcherPopup.js"
  install -Dm644 "schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml"
}
