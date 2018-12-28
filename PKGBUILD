pkgbase=python-pygdbmi
pkgname=('python-pygdbmi')
_module='pygdbmi'
pkgver=0.9.0.0
pkgrel=2
pkgdesc="Parse gdb machine interface output with Python"
url="https://github.com/cs01/pygdbmi"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pygdbmi/pygdbmi-${pkgver}.tar.gz")
source=("https://github.com/cs01/pygdbmi/archive/${pkgver}.tar.gz")
md5sums=('40c9174051b022774728c4cee8322681')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    rm -rf tests
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
