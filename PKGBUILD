# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=python-rmscene
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=2
pkgdesc="Parsing library for *.rm files in version 6."
arch=(any)
url="https://github.com/ricklupton/rmscene"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("d6ae29d6b1e00e996e86d095786f1fd6bf857be7016bb81ae738833a175b24fb")

build() {
    cd "$srcdir"/$_name-$pkgver

    python setup.py build
}

package() {
    cd "$srcdir"/$_name-$pkgver

    python setup.py install --root="$pkgdir" --optimize=1
}
