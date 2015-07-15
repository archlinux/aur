# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_pkg="howdoi"

pkgname=python2-$_pkg
pkgver=1.1.7
pkgrel=3
pkgdesc="A code search tool"
arch=(any)
url=("https://github.com/gleitz/howdoi")
license=('MIT')
depends=('python2' 'python2-pyquery' 'python2-requests-cache' 'python2-pygments' 'python2-requests')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/h/${_pkg}/${_pkg}-${pkgver}.tar.gz")
md5sums=('0b77b526f365b844ea9cbea1eb65696a')

package() {
    cd "$srcdir/$_pkg-$pkgver"
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}

