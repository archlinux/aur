# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name='pawk'
pkgname='python-pawk'
pkgver='0.7.0'
pkgrel=1
pkgdesc="A Python line-processor (like awk) based on pyline."
arch=('any')
url='https://github.com/alecthomas/pawk'
license=('PSF')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/alecthomas/pawk/archive/v${pkgver}.tar.gz")
sha256sums=('db7b9302efe32a42a3c1223b8122a1250ce2a0cd08fe442ecfa1dcf303dcfc78')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
