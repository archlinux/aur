# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-iclips
_name=iCLIPS
pkgver=0.3.0
pkgrel=1
pkgdesc="CLIPS Jupyter console"
arch=('any')
url="https://github.com/noxdafox/iclips"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')
depends=('jupyter-console' 'python-clipspy' 'python-regex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9d46155d68c9ac6e4684e0e62c5ede24a4629e8a7a7d714d5fc1432eb531f109')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
