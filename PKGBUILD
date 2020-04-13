# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgbase='tvdb_api'
pkgname='python-tvdb_api'
pkgver=2.0
pkgrel=3
pkgdesc="easy to use interface to thetvdb.com"
arch=('any')
url="http://github.com/dbr/tvdb_api"
license=('Unlicense')
depends=('python' 'python-requests' 'python-requests-cache')
makedepends=('python-setuptools')
conflicts=('tvdb_api')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/dbr/tvdb_api/archive/${pkgver}.tar.gz")
sha512sums=('c3913190292de970c16c010eeab04b791ea0ca9a8a244f522c7f53e791786c2b506de58c0287729e23895b20204fe4ecd914cdeb2fe178fc80c50f3431c0f0a3')

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
