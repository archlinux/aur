# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-aioxmpp
_name=${pkgname#python-}
pkgver=0.10.1
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
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
         'python-tzlocal')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6eb4e4485fb12301d23224f41f85f81b82767098db295c9803a05949fa2f50f9')

check() {
  cd "aioxmpp-$pkgver"
  python -m nose
}

package() {
  cd "aioxmpp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
