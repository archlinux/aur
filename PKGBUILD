# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=tvdb_api
pkgver=2.0
pkgrel=1
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')

source=(http://github.com/dbr/tvdb_api/tarball/$pkgver)
md5sums=('832c2852187b19f7bfc4a5e2f491d4da')

build() {
    cd "$srcdir/dbr-tvdb_api-"*
    python2 setup.py build
}

package() {
    cd "$srcdir/dbr-tvdb_api-"*
    python2 setup.py install --root="$pkgdir" --optimize=1
    find "$pkgdir" -type f -name '*.py' -exec sed -ri '1 s%\#!/usr/bin/(env python)|(python)%\#!/usr/bin/env python2%' {} \;
}
