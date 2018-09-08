# Maintainer: Amr Hassan

pkgname=bjarkan
pkgver=1.2.0
pkgrel=4
pkgdesc="A bluez 5 compatible command line utility and python 3 library "
arch=("any")
url="https://github.com/GetWellNetwork/bjarkan"
license=("BSD")
makedepends=("python-setuptools")
depends=("python" "python-systemd" "python-dbus" "python-gobject" "python-setuptools")
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
md5sums=('057281a4cebe4a4bb1ea80826df3a63b')
