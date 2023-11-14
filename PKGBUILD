# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="23.11.14"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("any")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL3")
depends=("gtk3" "gobject-introspection" "python-psutil")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("234caec1854c6ece424f1ef61f46178b")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

