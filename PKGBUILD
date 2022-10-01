# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gextractwinicons-git
pkgver=0.5.2
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="http://www.muflone.com/gextractwinicons"
arch=('any')
license=('GPL3')
makedepends=('git' 'python-setuptools' 'gettext')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'icoutils')
provides=('gextractwinicons')
conflicts=('gextractwinicons')
source=("git+https://github.com/muflone/gextractwinicons.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --optimize=1 --root "${pkgdir}"
}

