# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname='python-west'
_name="west"
pkgdesc="Zephyr RTOS Project meta-tool (wrapper and bootstrap)"
pkgver=0.6.3
pkgrel=1
arch=('any')
url='https://pypi.org/project/west/'
license=('Apache')
depends=('python-configobj' 'python-colorama' 'python-pykwalify')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd $srcdir/$_name-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('8b6486595a868fe005e4e7f07214779be3f2e2fb26d53e79c951c80c838c8662')
