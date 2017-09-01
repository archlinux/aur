#Maintainer: Florian Wittmann <fl0w1@disroot.org>
pkgname='python-mbstrdecoder'
_module='mbstrdecoder'
pkgver='0.2.2'
pkgrel=1
pkgdesc="multi-byte character string decoder"
url="https://github.com/thombashi/mbstrdecoder"
depends=('python' 'python-six>=1.10')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/mbstrdecoder/archive/v${pkgver}.tar.gz")
md5sums=('f528c26e537fe5c6987d5c5ccf6ab6e0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
