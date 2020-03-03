pkgname='python-allpairspy'
_module='allpairspy'
pkgver='2.5.0'
pkgrel=1
pkgdesc='A python library for test combinations generator'
url='https://github.com/thombashi/allpairspy'
depends=('python')
makedepends=('python-setuptools' 'python-six')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/allpairspy/archive/v${pkgver}.tar.gz")
sha256sums=('4af06f6af70d53f126daf04fda82ae1dbb8517b0bdad0f55aaa5e04f3d9daa6a')

BUILDENV+=('!check')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
