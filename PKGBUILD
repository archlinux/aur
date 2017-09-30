# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.9.1
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml'
'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict' 'python-babel')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('abc6e427221ea87761f1f80090d70a54397e7e6d9909036a95bcbc229c36a7c235418d728304e256c0bd4f0ed10ec703fbfd6abb40a5d249c894a6711b9f3bfe')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
