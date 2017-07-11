# Maintainer: Rok Pergarec <rok@parabola.si>

pkgname=gnome-shell-extension-dim-on-battery-git
pkgver=43.ebba9f2
_gitname=gnome-shell-dim-on-battery-extension
pkgrel=1
pkgdesc="An extension for gnome shell that will change the screen brightness when the machine is running on battery power"
arch=('any')
url="http://github.com/nailfarmer/gnome-shell-dim-on-battery-extension"
license=('GPL3')
depends=('gnome-shell>=3.14')
makedepends=('git')
provides=("gnome-shell-extension-dim-on-battery-git")
source=('git+http://github.com/nailfarmer/gnome-shell-dim-on-battery-extension.git')
sha1sums=('SKIP')

package() {
    cd "$srcdir/$_gitname"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    cp -R "dim-on-battery@nailfarmer.nailfarmer.com" "$pkgdir/usr/share/gnome-shell/extensions"
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
