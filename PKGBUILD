# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-aioxmpp
_name=${pkgname#python-}
pkgver=0.10.2
pkgrel=2
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
sha256sums=('b92362f7dfcc4d9940f833a62c87a4505fdffbeeb81beacfff52f9d90118ebd4')

check() {
  cd "aioxmpp-$pkgver"
  python -m nose
}

package() {
  cd "aioxmpp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
