# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-linearmodels')
_module='linearmodels'
pkgver='3.5'
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels/doc"
depends=('python'
    'python-numpy'
    'python-pandas'
    'python-scipy'
    'python-patsy')
checkdepends=('python-pytest' 'python-xarray')
optdepends=('python-xarray')
makedepends=('python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
source=("https://github.com/bashtage/linearmodels/archive/${pkgver}.tar.gz")
sha256sums=('1ca6fbc8ba130277e7f55d06145efde1f64320a7c40146ed059d67e84d93d564')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

#check() {
#    cd "${srcdir}/${_module}-${pkgver}"
#    py.test linearmodels --skip-slow
#}
