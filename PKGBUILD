# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_name=NSKeyedUnArchiver
pkgname=python-nskeyedunarchiver
pkgver=1.5
pkgrel=1
pkgdesc="Library for decoding Apple's text or binary plist files"
arch=(any)
url='https://github.com/avibrazil/NSKeyedUnArchiver'
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('ecdf53bdcfff34366c4fb0d4e4ff45e765a7571374af803a1f9acf6c42fa5d300f00a7e58cb1380e1f5d1e1ad06696652225a6ae4fcfe9b6627f510b749f32e1')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
