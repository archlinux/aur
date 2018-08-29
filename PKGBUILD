# Maintainer: Amr Hassan

pkgname=bjarkan
pkgver=1.3.0
pkgrel=2
pkgdesc="A bluez 5 compatible command line utility and python 3 library "
arch=("any")
url="https://github.com/GetWellNetwork/bjarkan"
license=("BSD")
makedepends=("python-setuptools")
depends=("python" "python-systemd")
source=("https://github.com/GetWellNetwork/bjarkan/archive/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('198816d4fb3caadfdaaef3db27b2c7ae')
