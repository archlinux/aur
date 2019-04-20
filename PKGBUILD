# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=python-jclib-git
conflicts=('python-jclib')
provides=('python-jclib')
pkgver=v0.1.0.r223.d34055ea0110
pkgrel=1
pkgdesc='The core of the jabbercat XMPP client'
arch=('any')
url='https://jabbercat.org'
license=('GPL3')
depends=('python'
         'python-hsluv')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/jabbercat/jclib.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "v%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
