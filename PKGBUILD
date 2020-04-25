# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Roger Duran <rogerduran at gmail dot com>

pkgname=python-httpie-jwt-auth
_pkgname=httpie-jwt-auth
pkgver=0.4.0
pkgrel=1
pkgdesc="JWTAuth (JSON Web Tokens) auth plugin for HTTPie"
url="https://github.com/teracyhq/httpie-jwt-auth"
license=('BSD')

source=("https://github.com/teracyhq/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('740c5082ac124660d77ad05a0bfee890834108d61794ad5241c4c75b94197f4e')
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
