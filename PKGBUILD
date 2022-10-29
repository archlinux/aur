# Maintainer: Torben <git@letorbi.com>

pkgname=gnome-shell-extension-draw-on-your-screen2-git
_pkgname=DrawOnYourScreen2
_extid='draw-on-your-screen2@zhrexl.github.com'
pkgver=12.r18.g6d5086a
pkgrel=1
pkgdesc="A drawing extension for the GNOME Shell."
arch=('any')
url="https://github.com/zhrexl/DrawOnYourScreen2"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/zhrexl/DrawOnYourScreen2.git#branch=GNOMEv42')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r "$_pkgname" "$pkgdir/usr/share/gnome-shell/extensions/"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/$_pkgname/.git"
  mv "$pkgdir/usr/share/gnome-shell/extensions/$_pkgname" "$pkgdir/usr/share/gnome-shell/extensions/$_extid"
}
