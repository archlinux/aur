# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gptrace-git
pkgver=0.6.0
pkgrel=1
pkgdesc="Trace the activities of an external application"
url="https://www.muflone.com/gptrace/"
arch=('any')
license=('GPL')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'python-ptrace')
makedepends=('git')
provides=('gptrace')
conflicts=('gptrace')
source=("git+https://github.com/muflone/gptrace.git")
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
  python setup.py install --optimize=1 --root "${pkgdir}" --skip-build
}

