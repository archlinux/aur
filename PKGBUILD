# Maintainer: Roger Duran <rogerduran at gmail dot com>

pkgname=python-httpie-jwt-auth
pkgdesc="JWTAuth (JSON Web Tokens) auth plugin for HTTPie"
license=('BSD')
url="https://github.com/teracyhq/httpie-jwt-auth"
pkgver=50.3a2ce34
pkgrel=1

source=("$pkgname::git://github.com/teracyhq/httpie-jwt-auth.git")
md5sums=('SKIP')
depends=('httpie')
makedepends=('python-distribute' 'git')
arch=('any')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python3 setup.py install --root="$pkgdir" --optimize=1
}
