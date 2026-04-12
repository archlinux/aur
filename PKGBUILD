# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnome-shell-extension-rounded-window-corners-reborn
pkgver=15.0543f16
pkgrel=1
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
arch=(any)
url=https://github.com/flexagoon/rounded-window-corners
license=(GPL-3.0-or-later)
depends=(gnome-shell)
source=(https://github.com/GrzegorzKozub/aur/raw/master/gnome-shell-extension-rounded-window-corners-reborn/rounded-window-corners@fxgn.shell-extension-"$pkgver".zip)
sha256sums=(de9f29811bbea2949e01ea040d0173a6e4f92a6c83133e940c3d566a3496c7b4)

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
