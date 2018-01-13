pkgbase=('python-pygdbmi')
pkgname=('python-pygdbmi')
_module='pygdbmi'
pkgver='0.8.2.0'
pkgrel=1
pkgdesc="Parse gdb machine interface output with Python"
url="https://github.com/cs01/pygdbmi"
depends=('python' 'python-pypeg2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pygdbmi/pygdbmi-${pkgver}.tar.gz")
md5sums=('e74d3d02fa5eef1223b5dedb13f9bbad')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
