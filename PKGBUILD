# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-google-auth-oauthlib')
_pkgname='google-auth-oauthlib'
pkgver='0.2.0'
pkgrel=1
pkgdesc="oauthlib integration for Google auth."
url="http://google-auth-oauthlib.readthedocs.io/en/latest/"
checkdepends=('python-pytest' 'python-mock')
depends=('python' 'python-google-auth'
'python-requests-oauthlib')
makedepends=()
optdepends=('python-click')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('226d1d0960f86ba5d9efd426a70b291eaba96f47d071657e0254ea969025728a')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
