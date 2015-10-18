# Maintainer: atomicbeef <teddyg522@gmail.com>
pkgname=python-libtcod-cffi
pkgver=0.2.3
pkgrel=1
pkgdesc="Python CFFI port of libtcod."
arch=('any')
url="https://pypi.python.org/pypi/libtcod-cffi"
license=('BSD')
depends=('python' 'python-cffi' 'sdl' 'libpng' 'zlib')
makedepends=('python-setuptools')
source=("https://github.com/HexDecimal/libtcod-cffi/archive/v$pkgver.tar.gz")
md5sums=('c1b9fff53fdffc7c6302bef23fc9f885')

prepare() {
    cd "libtcod-cffi-$pkgver"
    sed -i 's/"SDL.h"/<SDL\/SDL.h>/g' tcod/tdl_source.c
}

package() {
	cd "libtcod-cffi-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
