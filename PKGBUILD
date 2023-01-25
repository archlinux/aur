# Maintainer: Lucas Rooyakkers <lucas <dot> rooyakkers <dot> pm <dot> me>

pkgbase='python-itur'
pkgname=('python-itur')
_module='itur'
pkgver='0.3.4'
pkgrel=2
pkgdesc="A python implementation of the ITU-R P. Recommendations"
url="https://github.com/inigodelportillo/ITU-Rpy"
depends=('python' 'python-astropy' 'python-pyproj' 'python-certifi' 'python-scipy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2ce0967e6a02bed54dd9f02af096c40fa8bad8c01ca14c3bb01fd2a28603a251')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
