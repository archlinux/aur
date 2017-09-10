pkgbase=('python-pygdbmi')
pkgname=('python-pygdbmi')
_module='pygdbmi'
pkgver='0.7.4.2'
pkgrel=1
pkgdesc="Parse gdb machine interface output with Python"
url="https://github.com/cs01/pygdbmi"
depends=('python' 'python-pypeg2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pygdbmi/pygdbmi-${pkgver}.tar.gz")
md5sums=('6d5303b4250597649efa2accd3b0db93')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
