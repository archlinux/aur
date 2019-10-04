# Maintainer: fenuks

pkgname=covimerage
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/af/82/f6cf0d73e7459b993bd77e167d060c420479f416e7e37b67777593370f88/covimerage-0.2.0.tar.gz")
sha256sums=('2075e42da1fffb3656ea5c786c5c8d42657327a14c3f9c619977b10ccb73661b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
