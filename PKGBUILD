# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.8.0
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('f41c96fd17e9c352e2a2324cba4084bc0bc13df678a7852490d0c6cb89adcd6b3853f4d5d19edf051c1651aa58b8f0132e6b074b167f06919c4e8f5a5963868c')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
