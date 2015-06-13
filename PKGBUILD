# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=gextractwinicons-git
pkgver=0.4.2.g77d95e2
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="http://url.muflone.com/gextractwinicons"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'gtk-update-icon-cache' 'icoutils')
makedepends=('git')
provides=('gextractwinicons')
conflicts=('gextractwinicons')
source=("git+https://github.com/muflone/gextractwinicons.git")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python2 setup.py build
}

package() {
  cd "${pkgname%-*}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

