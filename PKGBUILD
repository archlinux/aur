# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-put-window-git
pkgver=r269.caeff2b
pkgrel=1
pkgdesc="Makes window movement a lot easier. Can be compared with a basic version of the compiz grid plugin."
arch=('i686' 'x86_64')
url="https://github.com/negesti/gnome-shell-extensions-negesti"
license=('unknown')
depends=('gnome-shell' 'libwnck3')
makedepends=('git')
install=gnome-shell-extension-put-window.install
source=("$pkgname::git+https://github.com/negesti/gnome-shell-extensions-negesti.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='putWindow@clemens.lab21.org'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  install -m644 "utils.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/utils.js"
  install -m644 "moveFocus.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/moveFocus.js"
   install -m644 "moveWorkspace.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/moveWorkspace.js"
  install -Dm644 "schemas/org.gnome.shell.extensions.org-lab21-putwindow.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.org-lab21-putwindow.gschema.xml"
}
