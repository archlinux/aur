pkgbase=('python-knnimpute')
pkgname=('python-knnimpute')
_module='knnimpute'
pkgver='0.0.1'
pkgrel=1
pkgdesc="k-Nearest Neighbor imputation"
url="https://github.com/hammerlab/knnimpute"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/e0/be/c54045678e31c36c0d47d7c2ec2db3c3b13e74e94741c4c5a0031fc4f2a9/knnimpute-${pkgver}.tar.gz")
md5sums=('463f67b3cb4dfa18f177d9f1a9594a2b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
