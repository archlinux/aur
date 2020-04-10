# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-aioxmpp
_name=${pkgname#python-}
pkgver=0.11.0
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('libxml2'
         'python'
         'python-aioopenssl'
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
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('63e5e133925e8a8e67f4deb9c5b68123f867fdec2747b57e8e83d09a655063cc')

check() {
  cd "aioxmpp-$pkgver"
  python -m nose
}

build() {
  cd "aioxmpp-$pkgver"
  python setup.py build
}

package() {
  cd "aioxmpp-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
