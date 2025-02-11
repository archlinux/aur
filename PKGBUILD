# Maintainer: Ariana Gregg <lovetocode999 at tilde dot team>
pkgname=python-pagelabels
_name="pagelabels-py"
pkgver=1.2.1
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
sha256sums=('45e88bd1f6978ec7d28093cd3ca94227ff04406689f559b59b33168cabccab60')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
