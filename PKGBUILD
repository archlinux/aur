#Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='python-humblewx'
_module='humblewx'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Library that simplifies creating user interfaces with wxPython."
license=('GPL3')
url="https://github.com/thetimelineproj/humblewx"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/h/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('1d3b30936aecf7570565a73878ed7f73')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
