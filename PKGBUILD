# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-audio-output-switcher-git
pkgver=r27.89e6e29
pkgrel=1
pkgdesc="Adds a switch for choosing audio output to the system menu."
arch=('i686' 'x86_64')
url="https://github.com/adaxi/audio-output-switcher"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=("$pkgname::git+https://github.com/adaxi/audio-output-switcher")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  _uuid='audio-output-switcher@anduchs'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "utils.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/utils.js"
  install -Dm644 "schemas/org.gnome.shell.extensions.audio-output-switcher.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.audio-output-switcher.gschema.xml"
}
