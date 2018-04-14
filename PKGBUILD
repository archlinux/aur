pkgbase=('python-bumpversion')
pkgname=('python-bumpversion')
_module='bumpversion'
pkgver='0.5.3'
pkgrel=1
pkgdesc="Version-bump your software with a single command!"
url="https://github.com/peritus/bumpversion"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/bumpversion/bumpversion-${pkgver}.tar.gz")
md5sums=('c66a3492eafcf5ad4b024be9fca29820')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
