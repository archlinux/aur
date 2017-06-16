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
sha512sums=('1139453974d42dcdfd13f339ff04117d872eeda1089e45a64415603ce629217d8eb35452930ccc3fdf69e9f637cde9d0167ec323beef04543bdef91bbfa7b5b4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
