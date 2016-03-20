# Maintainer: atomicbeef <teddyg522@gmail.com>
pkgname=python-libtcod-cffi
pkgver=0.2.8
pkgrel=1
pkgdesc="Python CFFI port of libtcod."
arch=('any')
url="https://pypi.python.org/pypi/libtcod-cffi"
license=('BSD')
depends=('python' 'python-cffi' 'sdl' 'libpng' 'zlib')
makedepends=('python-setuptools' 'unzip')
source=("libtcod-cffi-$pkgver.zip::https://pypi.python.org/packages/source/l/libtcod-cffi/libtcod-cffi-0.2.8.zip#md5=97a790694da1ea7eccb426a25c76f462")
md5sums=('97a790694da1ea7eccb426a25c76f462')

prepare() {
    cd "libtcod-cffi-$pkgver"
    sed -i 's/"SDL.h"/<SDL\/SDL.h>/g' tcod/tdl_source.c
}

package() {
	cd "libtcod-cffi-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
