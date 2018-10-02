# Maintainer: Sam Whited <sam@samwhited.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-aioxmpp-git
conflicts=('python-aioxmpp')
provides=('python-aioxmpp')
pkgver=v0.11.0a0.r1762.b653fb817bd5
pkgrel=1
pkgdesc='An XMPP library for use with asyncio'
arch=('any')
url='https://github.com/horazont/aioxmpp'
license=('LGPL3')
depends=('python'
         'libxml2'
         'python-aiosasl'
         'python-babel'
         'python-dnspython'
         'python-lxml'
         'python-multidict'
         'python-orderedset'
         'python-pyasn1'
         'python-pyasn1-modules'
         'python-pyopenssl'
         'python-sortedcollections'
         'python-tzlocal')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/horazont/aioxmpp.git")
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
