# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname='python-west'
_name="west"
pkgdesc="Zephyr RTOS Project meta-tool (wrapper and bootstrap)"
pkgver=0.5.6
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

sha256sums=('0cdae367f5b9439060dde5fd58ad794cbd70d7ab83f7cb8fe6b1bbc9a4301ece')
