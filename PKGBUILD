# Maintainer: fenuks

pkgname=covimerage
pkgver=0.2.2
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
source=("https://files.pythonhosted.org/packages/e7/fd/45a6ce480ac42e53b5d6cf6c8c93620e5d2ba39060df2713fff00651e2de/covimerage-0.2.2.tar.gz")
sha256sums=('5ef40302f028c86fa7c6b30f5a0026b5049df7635680d49190ae5575b81ca3ba')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
