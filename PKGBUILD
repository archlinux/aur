# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.7.2
pkgrel=2
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('76a4d245d6a1749d07a3a782959fe91b271cffd1e751f836cd6544b563bd2d3c9d43a1eea05c8967281e86d3d30ff6eb75d79244eb8ff0b93c2cb40103421454')

check() {
    cd "$_pkgname-$pkgver"
    # FIXME temporary test exclusion; waiting for upstream fix
    python -m nose --exclude=test_error_dispatch
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
