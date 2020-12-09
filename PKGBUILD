# Maintainer: wenbushi <wenbushi@gmail.com>

pkgbase='python-browsercookie'
pkgname='python-browsercookie'
_module='browsercookie'
pkgver='0.7.7'
pkgrel=1
pkgdesc="Loads cookies from your browser into a cookiejar object"
url="https://github.com/richardpenman/browsercookie"
depends=('python-pycryptodome' 'python-keyring' 'python-lz4')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
license=('LGPL')
arch=('any')
source=("${pkgname}"::"https://files.pythonhosted.org/packages/17/36/07a04cf7b3b5b944d14cc7f0a8131d056dc18847efe0cd3928dfe076bbfc/${_module}-${pkgver}.tar.gz")
sha256sums=('d085c827cacc0c2396e7ffa1ab5177ef7f2a490d13e85ed6cb41eefb745447ed')
dirname="${_module}-${pkgver}"

build() {
    cd "${srcdir}/${dirname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${dirname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
