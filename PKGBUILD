# Maintainer: arielzn <arielzn@riseup.net>

pkgbase='python-archspec'
pkgname=('python-archspec')
_module='archspec'
pkgver='0.1.4'
pkgrel=1
pkgdesc="A library for detecting, labeling, and reasoning about microarchitectures"
url="https://github.com/archspec/archspec"
depends=('python'
         'python-click>=8.0' 'python-click<9.0'
         'python-six>=1.13.0' 'python-six<2.0.0')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b8d5eeb4caf892790ff1aa8ccef442a84187986aeab4da29417c9fe35532d94c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
