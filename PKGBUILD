# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gnome-appfolders-manager-git
_pkgname="${pkgname%-*}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Manage GNOME Shell applications folders."
url="http://www.muflone.com/gnome-appfolders-manager"
arch=('any')
license=('GPL3')
depends=('gtk3' 'python-xdg' 'python-gobject' 'python-setuptools')
makedepends=('git')
provides=('gnome-appfolders-manager')
conflicts=('gnome-appfolders-manager')
source=("git+https://github.com/muflone/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}
