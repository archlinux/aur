# Maintainer: Rodrigo Farias <rodrigofarias77 at gmail dot com>

pkgname=unrpyc-git
pkgver=1.1.8+0+g2f9810c
pkgrel=2
pkgdesc="A ren'py script decompiler"
arch=('any')
url='https://github.com/CensoredUsername/unrpyc'
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')
conflicts=('unrpyc')
provides=('unrpyc')
source=("git+$url")
md5sums=('SKIP')

repo=${url##*/}

pkgver () {
    cd "$srcdir/$repo"
    git describe --long --tags | sed 's/^v//; s/-/+/g'
}

prepare () {
    cd "$srcdir/$repo"
}

package () {
    cd "$srcdir/$repo"
    python2 setup.py install --root="$pkgdir"
    cd "$pkgdir"
    mv usr/bin/unrpyc{.py,}
}
