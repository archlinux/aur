# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gwakeonlan-git
pkgver=0.8.5
pkgrel=1
pkgdesc="GTK+ utility to awake machines using the Wake on LAN."
url="http://www.muflone.com/gwakeonlan/"
arch=('any')
license=('GPL3')
makedepends=('git' 'python-setuptools' 'gettext')
depends=('gtk3' 'python-xdg' 'python-gobject')
provides=('gwakeonlan')
conflicts=('gwakeonlan')
source=("git+https://github.com/muflone/gwakeonlan.git")
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

