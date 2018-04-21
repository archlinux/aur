# Maintainer: fenuks

pkgname=covimerage
pkgver=0.0.4
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
source=("https://github.com/Vimjas/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4e9f247f949faf400c4d9f1f608e3c20')
sha256sums=('3aaba249ad7be808dc22cbbf333e9ef97fe28f548a77916b7b2deea15dd6b5e4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
