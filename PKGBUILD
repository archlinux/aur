# Maintainer: Foivos S. Zakkak <foivos at zakkak dot net>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-workspace-grid
pkgver=1.3.4.r0.g22b96b2
pkgrel=1
pkgdesc="Allows to configure your workspaces in a grid"
arch=('i686' 'x86_64')
url="https://github.com/zakkak/workspace-grid-gnome-shell-extension"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
install=gnome-shell-extension-workspace-grid.install
source=("$pkgname::git+https://github.com/zakkak/workspace-grid-gnome-shell-extension.git#tag=v1.3.4")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  _uuid='workspace-grid@mathematical.coffee.gmail.com'

  install -Dm644 "${_uuid}/metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "${_uuid}/extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "${_uuid}/convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/convenience.js"
  install -m644 "${_uuid}/prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  install -m644 "${_uuid}/stylesheet.css" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/stylesheet.css"
  install -m644 "${_uuid}/ws-switch-arrow-left.png" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/ws-switch-arrow-left.png"
  install -m644 "${_uuid}/ws-switch-arrow-right.png" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/ws-switch-arrow-right.png"
  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml"
}
