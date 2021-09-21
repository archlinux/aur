# Maintaner: jskier <jay@jskier.com>
# Contributor: fennerm
pkgbase='python-bumpversion'
pkgname=('python-bumpversion')
_module='bumpversion'
pkgver='0.6.0'
pkgrel=1
pkgdesc="Version-bump your software with a single command!"
url="https://github.com/peritus/bumpversion"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/bumpversion/bumpversion-${pkgver}.tar.gz")
sha256sums=('4ba55e4080d373f80177b4dabef146c07ce73c7d1377aabf9d3c3ae1f94584a6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
