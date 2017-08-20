# Maintainer: Tom Vincent

pkgname=gnome-shell-extension-extended-gestures-git
pkgver=45.25f6044
_gitname=gnome-shell-extended-gestures
_uuid='extendedgestures@mpiannucci.github.com'
pkgrel=1
pkgdesc='Better touchpad gesture handling for GNOME'
url='https://github.com/mpiannucci/gnome-shell-extended-gestures'
arch=('any')
license=('GPL3')
depends=('gnome-shell>=3.24')
makedepends=('git' 'zip' 'unzip')
source=('git://github.com/mpiannucci/gnome-shell-extended-gestures.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  ./package.sh
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  unzip "$_uuid.zip" -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
