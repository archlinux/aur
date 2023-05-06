# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname=python-morphys
pkgver=1.0
pkgrel=4
pkgdesc="Smart conversions between unicode and bytes types for common cases (no active development)"
url="https://github.com/mkalinski/morphys"
depends=('python>=3.11')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/mkalinski/morphys/zip/0642a71126c32cd26b3a443a5cac27e4e1f7240f")
b2sums=('3ba33596abf5d2fd70aeceaf7b63d79a5d126359499f6167581fc1f65c7f6f35d9afcb0ccea3172cae145289595e9f18844d2f7ce0bf6ce135066350815be27a')

build() {
    mv $srcdir/morphys-0642a71126c32cd26b3a443a5cac27e4e1f7240f $srcdir/${pkgname}-${pkgver}
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=2 --skip-build
}
