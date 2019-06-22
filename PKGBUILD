# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-python
pkgver=2019
pkgrel=1

pkgdesc='GNAT Components Collection - interface to the python interpreter.'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('python2' 'gnatcoll-core')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5cdf8afa31e87a8f1d425054'
        'setup.py-patch')
sha1sums=('964ece4f78755a2fb3c1c84cec2c375cda66bd98'
          '92d80368c81b0e9eef3f9ab7e0fcc5da61b532e9')

prepare()
{
    cd "$srcdir/gnatcoll-bindings-2019-20190430-1928C-src/python"
    patch -Np0 -i "$srcdir"/setup.py-patch
}

build()
{
    cd "$srcdir/gnatcoll-bindings-2019-20190430-1928C-src/python"
    python2 setup.py build -j1 --prefix=/usr
}

package()
{
    cd "$srcdir/gnatcoll-bindings-2019-20190430-1928C-src/python"
    python2 setup.py install --prefix="$pkgdir/usr"
}
