# Maintainer: wenbushi <wenbushi@gmail.com>

pkgbase=('python-browsercookie')
pkgname=('python-browsercookie')
_module='browsercookie'
pkgver='0.7.5'
pkgrel=1
pkgdesc="Loads cookies from your browser into a cookiejar object"
url="https://bitbucket.org/richardpenman/browsercookie"
depends=('python-pycryptodome' 'python-keyring' 'python-lz4')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
license=('LGPL')
arch=('any')
source=("${pkgname}"::"https://files.pythonhosted.org/packages/52/c7/df624e7fef8bbdf994510c2138f771c27142075a9cdb611adcb47e0d4e90/${_module}-${pkgver}.tar.gz")
sha256sums=('25bebd5ae2143b510c0c466fb29bc40d3604f35132061684b17ee43f7c46754f')
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
