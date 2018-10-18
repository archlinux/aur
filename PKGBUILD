# Maintainer: Roger Duran <rogerduran at gmail dot com>

pkgname=python-httpie-jwt-auth
_pkgname=httpie-jwt-auth
pkgver=0.3.0
pkgrel=1
pkgdesc="JWTAuth (JSON Web Tokens) auth plugin for HTTPie"
url="https://github.com/teracyhq/httpie-jwt-auth"
license=('BSD')

source=("https://github.com/teracyhq/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('31a32ef93a00f50bfd593004f35ce99390c3b4471aa514d602cd6d8a34d183f7')
depends=('httpie')
makedepends=('python-distribute')
arch=('any')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
