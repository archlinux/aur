# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname='python-west'
_name="west"
pkgdesc="Zephyr RTOS Project meta-tool (wrapper and bootstrap)"
pkgver=0.6.1
pkgrel=1
arch=('any')
url='https://pypi.org/project/west/'
license=('Apache')
depends=('python-configobj')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd $srcdir/$_name-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('ef1a3aee5f25aec5ac154784b0d2079ebf5f988fd57515d3a8ed5b914e3fc114')
