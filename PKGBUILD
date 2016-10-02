# Maintainer: Ted Gregor <teddyg522@gmail.com>

pkgname=python-libtcod-cffi
pkgver=1.0
pkgrel=1
pkgdesc="Python CFFI port of libtcod."
arch=('any')
url="https://pypi.python.org/pypi/libtcod-cffi"
license=('BSD')
depends=('python' 'python-cffi' 'sdl' 'libpng' 'zlib')
makedepends=('python-setuptools' 'unzip')
source=("https://pypi.python.org/packages/08/e8/32a3bab98a7c3de162c917db2c6a6ad2f962019d48a01d2bae973eadb50a/libtcod-cffi-1.0.zip#md5=7463496b14cd282c9e8ac8a54b1063dc")
md5sums=('7463496b14cd282c9e8ac8a54b1063dc')

prepare() {
    cd "libtcod-cffi-$pkgver"
    sed -i 's/"SDL.h"/<SDL\/SDL.h>/g' src/tdl_source.c
}

package() {
    cd "libtcod-cffi-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
