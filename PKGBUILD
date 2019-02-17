# Maintainer: fenuks

pkgname=covimerage
pkgver=0.1.5
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
source=("https://files.pythonhosted.org/packages/1d/23/6c240b74e77664e89657f915abdea8b05bf672771fa46ae214f4ef7c5a21/covimerage-0.1.5.tar.gz")
sha256sums=('0147dfaad24697d8e5c047ac1dcfddc37f8a78dd772adfb6228928ef8578a6ed')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
