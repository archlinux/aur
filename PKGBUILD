# Maintainer: Conni2461 <Simon-Hauser@outlook.de>

_name=klepto
pkgname=python-klepto
pkgver=0.2.1
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
sha512sums=('584246985eaf6a3076b4fb67a39fa11144dc8902844a7b67b603e0108ef9b25f27225bdbd938e307b1100f0598c55713167737d3e1af2ff29c871d2e61540aa7')

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
