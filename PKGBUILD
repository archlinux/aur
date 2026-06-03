# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgver=15.4af9a02
pkgrel=1
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
arch=(any)
url=https://github.com/flexagoon/rounded-window-corners
license=(GPL-3.0-or-later)
depends=(gnome-shell)
source=(https://github.com/GrzegorzKozub/aur/raw/master/gnome-shell-extension-rounded-window-corners-reborn/rounded-window-corners@fxgn.shell-extension-"$pkgver".zip)
sha256sums=(ac6ecceeadf1ebb75bc8c294e175ded39521f00ebd16d13339056c2925dcd6fc)

package() {
  local uuid=rounded-window-corners@fxgn
  local extdir="$pkgdir"/usr/share/gnome-shell/extensions/"$uuid"
  install -d "$extdir"
  bsdtar -xvf "$uuid".shell-extension-"$pkgver".zip -C "$extdir" --no-same-owner
  mv "$extdir"/locale "$pkgdir"/usr/share/
  install -Dm644 \
    "$extdir"/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml \
    -t "$pkgdir"/usr/share/glib-2.0/schemas/
  rm -rf "$extdir"/schemas/
}
