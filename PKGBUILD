# Maintainer: Muflone http://url.muflone.com/contacts

pkgname=gwakeonlan-git
pkgver=0.6.1
pkgrel=1
pkgdesc="GTK+ utility to awake machines using the Wake on LAN."
url="http://url.muflone.com/gwakeonlan"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'gtk-update-icon-cache')
makedepends=('git')
provides=('gwakeonlan')
conflicts=('gwakeonlan')
source=("git+https://github.com/muflone/gwakeonlan.git")
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

