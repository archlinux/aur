# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgbase='tvdb_api'
pkgname='python-tvdb_api'
pkgver=3.0.2
pkgrel=1
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('Unlicense')
depends=('python' 'python-requests' 'python-requests-cache')
makedepends=('python-setuptools')
conflicts=('tvdb_api')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/dbr/tvdb_api/archive/${pkgver}.tar.gz")
sha512sums=('4abb7d0d0fdf4a62023c13d0afaf0f5c1703b686a8602115a69da6a1c39d0f427a04d47e5fc95e89faa4893f8fa7cd2abcd437aa2b5f7a47b7a94580568340fc')

build()
{
    cd "$srcdir/tvdb_api-$pkgver"
    python setup.py build
}

package_python-tvdb_api()
{
    cd "$srcdir/tvdb_api-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
