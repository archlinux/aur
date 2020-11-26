# Maintainer: Conni2461 <Simon-Hauser@outlook.de>

_name=klepto
pkgname=python-klepto
pkgver=0.2.0
pkgrel=1
pkgdesc="persistent caching to memory, disk, or database"
arch=('any')
url="https://github.com/uqfoundation/klepto"
license=('BSD')
depends=('python'
         'python-dill'
         'python-pox')
makedepends=('python-setuptools')
optdepends=('python-h5py'
            'python-pandas'
            'python-sqlalchemy'
            'python-jsonpickle'
            'python-cloudpickle'
            'python-setuptools')
source=("https://github.com/uqfoundation/${_name}/releases/download/${_name}-${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('cc85faf7663b2b7b3e561b2b40db508b3a2667c3eea3e26e8bed6f8bd0ae1e423c28d8d5ca72b4b0001e3921a6a30753039ff68e506a30475e30a2b4bc219d38')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
