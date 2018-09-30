pkgbase=('python-pygdbmi')
pkgname=('python-pygdbmi')
_module='pygdbmi'
pkgver=0.8.3.0
pkgrel=1
pkgdesc="Parse gdb machine interface output with Python"
url="https://github.com/cs01/pygdbmi"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pygdbmi/pygdbmi-${pkgver}.tar.gz")
source=("https://github.com/cs01/pygdbmi/archive/${pkgver}.tar.gz")
md5sums=('19ff554f4d417aa5e19b4d5cffdff314')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
