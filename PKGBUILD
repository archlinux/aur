# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Andrew P. <pan.pav.7c5@gmail.com>

_pkgname=lightdm-gtk-greeter-settings
pkgname=$_pkgname-bzr
pkgver=r68
pkgrel=1
pkgdesc="Settings editor for LightDM GTK+ Greeter"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-gtk-greeter-settings"
license=('GPL3' 'LGPL3')
depends=('gtk3' 'python' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('bzr' 'python-distutils-extra')
provides=('lightdm-gtk-greeter-settings')
conflicts=('lightdm-gtk-greeter-settings')
install=$_pkgname.install
source=("bzr+lp:$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s" "$(bzr revno)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

