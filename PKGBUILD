# Maintainer: Alexei Colin <ac@alexeicolin.com>

pkgname='python-west'
_name="west"
pkgdesc="Zephyr RTOS Project meta-tool (wrapper and bootstrap)"
pkgver=0.9.0
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

sha256sums=('6f55a45f19335c79ff3245187f5131b609cfec037ab01009dcf49c39f6e04fab')
