# Maintainer: fenuks

pkgname=covimerage
pkgver=0.1.4
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
source=("https://files.pythonhosted.org/packages/79/2b/a9f16f81af06b2cec0b591da2fcc46040a8769afe88146d05243e8bbf963/covimerage-0.1.4.tar.gz")
sha256sums=('aa20b8a43a402330dfa1c14453c6b426aba49f0de3cff60a5e5822127ff0fdb1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
