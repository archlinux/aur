# Maintainer: Andreas Berg <andreas.j.berg at gmail dot com>
_pkgbasename=gtklick
pkgname=${_pkgbasename}-git
pkgver=r85.596028e
pkgrel=1
pkgdesc='a simple GTK metronome for jack based on klick'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/gtklick/'
license=('GPL')
depends=('klick' 'python2-pyliblo' 'pygtk')
makedepends=()
provides=(${_pkgbasename})
conflicts=(${_pkgbasename})
source=('git://github.com/dsacre/gtklick.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
