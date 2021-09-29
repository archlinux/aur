# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgbase='tvdb_api'
pkgname='python-tvdb_api'
pkgver=3.1
pkgrel=1
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('Unlicense')
depends=('python' 'python-requests' 'python-requests-cache')
makedepends=('python-setuptools')
conflicts=('tvdb_api')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/dbr/tvdb_api/archive/${pkgver}.tar.gz")
sha512sums=('edae9e430e3d738ceff8e75c2b2c41bfcd981b13ef2247b9e2dc165b87f8f1108f4938cec8013daf03c120e9fc9da1b114cd6bd1a06adb9eeeac8470f06ae369')

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
