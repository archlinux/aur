# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-djhtml
_name=${pkgname#python-}
pkgver=3.0.6
pkgrel=1
pkgdesc="Django/Jinja template indenter"
arch=('any')
url="https://github.com/rtts/djhtml"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('abfc4d7b4730432ca6a98322fbdf8ae9d6ba254ea57ba3759a10ecb293bc57de')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}