pkgbase='python-dummy-pack'
pkgname=('python-dummy-pack')
_module='dummy-pack'
pkgver=0.0.2
pkgrel=1

pkgdesc="dummy"
url="https://github.com/codeswhite/"
depends=('python' 'dee' 'python-interutils')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/dummy-pack/dummy-pack-${pkgver}.tar.gz")
sha256sums=("2acf65a8ba222eedf1470e3d6f2984939881b436b0e6abb51355e8cd96e6cff9")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
