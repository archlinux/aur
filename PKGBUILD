# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="http://www.muflone.com/gptrace/"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'python2-ptrace' 'gtk-update-icon-cache')
makedepends=('git')
provides=('gptrace')
conflicts=('gptrace')
source=("git+https://github.com/muflone/gptrace.git")
sha256sums=('SKIP')
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

