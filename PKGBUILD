# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-google-auth-oauthlib')
_pkgname='google-auth-oauthlib'
pkgver='0.4.0'
pkgrel=1
pkgdesc="oauthlib integration for Google auth."
url="http://google-auth-oauthlib.readthedocs.io/en/latest/"
checkdepends=('python-click' 'python-pytest' 'python-mock')
depends=('python' 'python-google-auth'
'python-requests-oauthlib')
makedepends=()
optdepends=('python-click')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6a8b0072048940d1f41c23c03576867e577e826fec140a1c7e148ec486e083ba')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    rm -rf tests/__pycache__
    pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
