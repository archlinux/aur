# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-readline
pkgver=2018
pkgrel=2

pkgdesc='GNAT Components Collection - Binding to readline'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('readline' 'gnatcoll-core>=2018')
makedepends=('gprbuild>=2018')

source=('http://mirrors.cdn.adacore.com/art/5b0ce9cfc7a4475261f97ca5')
sha1sums=('42682c885e4a02bb03786aa9ece3a4214ca419f8')

build()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/readline"
    python2 setup.py build -j1 --prefix=/usr -R --accept-gpl
}

package()
{
    cd "$srcdir/gnatcoll-bindings-gpl-2018-src/readline"
    python2 setup.py install --prefix="$pkgdir/usr"
}
