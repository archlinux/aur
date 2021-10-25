# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname='python-west'
_name="west"
pkgdesc="Zephyr RTOS Project meta-tool"
pkgver=0.11.1
pkgrel=1
arch=('any')
url='https://pypi.org/project/west/'
license=('Apache')
depends=('python-configobj'
         'python-colorama'
         'python-pykwalify'
         'python-pyaml')
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

sha256sums=('30771f3ec2a4281cd05c277a90f7dc94ded97d6dc1e1decdf4fe452dbbacc283')
