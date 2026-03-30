# Maintainer: Lucas Rooyakkers <lucas <dot> rooyakkers <dot> pm <dot> me>

pkgbase='python-itur'
pkgname=('python-itur')
_module='itur'
pkgver='0.4.0'
pkgrel=1
pkgdesc="A python implementation of the ITU-R P. Recommendations"
url="https://github.com/inigodelportillo/ITU-Rpy"
depends=('python' 'python-astropy' 'python-numpy' 'python-pyproj' 'python-scipy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b833021dc11321f28a03560ec4ee27cdff60234bf4ec25642f013e33d254411e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
