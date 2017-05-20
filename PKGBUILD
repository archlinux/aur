# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e232bea5acd8aafb2df6a1d7ae4075701c8d6c0e2877f9cba9d2966008e5e43be422378b2860adfc8fb0eb461c562fe9574425f914eddffd9bd6ac6c8699fd50')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
