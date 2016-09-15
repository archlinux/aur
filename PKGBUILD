pkgbase=('python-fancyimpute')
pkgname=('python-fancyimpute')
_module='fancyimpute'
pkgver='0.0.19'
pkgrel=1
pkgdesc="Matrix completion and feature imputation algorithms"
url="https://github.com/hammerlab/fancyimpute"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/51/79/b8b630d3d68eaa7ecfe10aad0203dfe349bb4fa4fcff76deaf4dc9e831c8/fancyimpute-${pkgver}.tar.gz")
md5sums=('fc1de27ecc0aa0169c7bb65383247d4e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
