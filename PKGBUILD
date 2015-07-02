# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=tvdb_api
pkgver=1.9
pkgrel=2
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')

source=(http://github.com/dbr/tvdb_api/tarball/$pkgver)
md5sums=('b3f9c1a809967f3a14a694ac530fd3eb')

build() {
    cd "$srcdir/dbr-tvdb_api-"*
    python2 setup.py build
}

package() {
    cd "$srcdir/dbr-tvdb_api-"*
    python2 setup.py install --root="$pkgdir" --optimize=1
    find "$pkgdir" -type f -name '*.py' -exec sed -ri '1 s%\#!/usr/bin/(env python)|(python)%\#!/usr/bin/env python2%' {} \;
}
