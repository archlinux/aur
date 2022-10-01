# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtransmemory-git
pkgver=0.4.0
pkgrel=1
pkgdesc="GTK+ application to manage words and sentences translations in many memories for each language."
url="http://www.muflone.com/gtransmemory"
arch=('any')
license=('GPL3')
makedepends=('git' 'python-setuptools')
depends=('gtk3' 'python-xdg' 'python-gobject' 'python-polib')
provides=('gtransmemory')
conflicts=('gtransmemory')
source=("git+https://github.com/muflone/gtransmemory.git")
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
