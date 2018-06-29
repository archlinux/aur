# Maintainer: fenuks

pkgname=covimerage
pkgver=0.0.6
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
md5sums=('7c0253119b97a2946bb37139bce2cfce')
sha256sums=('731956afbbac2a4b43684ca418b8117451c3bf9d316ef2ac000e68ba2983c01c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
