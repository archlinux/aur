# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gnatcoll-readline
pkgver=2019
pkgrel=1

pkgdesc='GNAT Components Collection - Binding to readline'
url='https://github.com/AdaCore/gnatcoll-bindings/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('readline' 'gnatcoll-core')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5cdf8afa31e87a8f1d425054')
sha1sums=('964ece4f78755a2fb3c1c84cec2c375cda66bd98')

build()
{
    cd "$srcdir/gnatcoll-bindings-2019-20190430-1928C-src/readline"
    python2 setup.py build -j1 --prefix=/usr --accept-gpl
}

package()
{
    cd "$srcdir/gnatcoll-bindings-2019-20190430-1928C-src/readline"
    python2 setup.py install --prefix="$pkgdir/usr"
}
