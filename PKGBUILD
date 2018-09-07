# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=gnatcoll-iconv
pkgver=2018
pkgrel=1

pkgdesc='GNAT Components Collection - Bindings to Libiconv'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'libiconv' 'gnatcoll-core')
makedepends=('gprbuild')

provides=('gnatcoll-iconv')
conflicts=('gnatcoll-iconv')

source=('http://mirrors.cdn.adacore.com/art/5b0ce9cfc7a4475261f97ca5')
sha1sums=('42682c885e4a02bb03786aa9ece3a4214ca419f8')


build()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/iconv"
    python2 setup.py build -j$(nproc) --prefix=/usr -R
}

package()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/iconv"

    python2 setup.py install --prefix="$pkgdir/usr"
}
