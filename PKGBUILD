# $Id$
# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >

pkgname=gnome-shell-extension-window-corner-preview-git
pkgver=2.r19.g9c1e97c
pkgrel=1
pkgdesc='Extension for GNOME shell to show a video preview on the corner of the screen.'
arch=(any)
url="https://github.com/medenagan/window-corner-preview"
license=('MIT')
depends=('gnome-shell>=3.10')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "window-corner-preview"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "window-corner-preview"
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -a "window-corner-preview@fabiomereu.it" \
    "${pkgdir}/usr/share/gnome-shell/extensions/"
}
# vim:set ts=2 sw=2 et:
