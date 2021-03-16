# Maintainer: Elijah Gregg <lovetocode999@ctrl-c.club>
pkgname=python-pagelabels
_name="pagelabels-py"
pkgver=1.2.0
pkgrel=1
pkgdesc="Python library to manipulate PDF page numbers and labels."
arch=("x86_64")
url="https://github.com/lovasoa/pagelabels-py"
license=("GPL3")
makedepends=("python-setuptools")
depends=("python" "python-pdfrw")
provides=("python-pagelabels")
conflicts=("python-pagelabels")
source=("${_name}-${pkgver}.tar.gz::https://github.com/lovasoa/pagelabels-py/archive/v${pkgver}.tar.gz")
sha256sums=('409d98befa60938e059ed3a52ad9782f0b2ce32e794d54a79a9db0e6367c9ac8')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
