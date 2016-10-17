# Maintainer: renek <aur@spaceshore.net>
_pkgname=aioxmpp
pkgname=python-${_pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="An XMPP library for use with Python 3.4 asyncio"
arch=('any')
url="https://github.com/horazont/aioxmpp"
license=('LGPL3')
depends=('python' 'python-dnspython' 'libxml2' 'python-lxml' 'python-orderedset' 'python-tzlocal' 'python-pyopenssl' 'python-pyasn1' 'python-pyasn1-modules' 'python-aiosasl' 'python-multidict')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e59f6ab2a69667fc1edf9a860a468309da72acd336a7fdf44c6795bbf9869acb69aa851eff549395cad77ccb4a101cfdbbd7d4a4efa39ae0960969c22ae6ccd2')

check() {
    cd "$_pkgname-$pkgver"
    python -m nose
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
