# Maintainer: fenuks

pkgname=covimerage
pkgver=0.0.9
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
source=("https://files.pythonhosted.org/packages/89/e9/36951aec127c53f0c6f5ae2b8cc8fd5e09c70b1b3b760ec1d6bdd370fa4a/covimerage-0.0.9.tar.gz")
md5sums=('953e055d8c0cb2a404854f8f8646b30b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
