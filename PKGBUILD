# Maintainer: Torben <git@letorbi.com>

pkgname=gnome-shell-extension-draw-on-gnome-git
_pkgname='Draw-On-Gnome'
_extid='draw-on-gnome@daveprowse.github.io'
pkgver=11.1.r0.g5b63605
pkgrel=1
pkgdesc='Annotate your GNOME desktop.'
arch=('any')
url="https://github.com/daveprowse/Draw-On-Gnome"
license=('GPL3')
depends=(gnome-shell gjs)
makedepends=('git')
source=('git+https://github.com/daveprowse/Draw-On-Gnome.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r "$_pkgname" "$pkgdir/usr/share/gnome-shell/extensions/$_extid"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/$_extid/.git"
}
