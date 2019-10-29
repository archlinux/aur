# Maintainer: fenuks

pkgname=covimerage
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate coverage information for Vim scripts."
arch=("any")
url="https://github.com/Vimjas/${pkgname}"
license=("GPL3")
depends=("python-coverage" "python-click" "python-attrs")
# optdepends=()
makedepends=("python-setuptools")  
conflicts=("${pkgname}")
# install=$pkgname.install
# source=("https://github.com/Vimjas/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/a1/be/0bcf26319fd2a1da72385af9cc02008fa304c6528205a5b2b41abd9a3693/covimerage-0.2.1.tar.gz")
sha256sums=('a75fd6a4f7d743e40977f2f1d556040e8fad5a1122dbf8d63cd759d811fd64f6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
