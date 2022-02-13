# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="21.1.28"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("any")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL3")
depends=("gtk3" "gobject-introspection" "python-psutil")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("5c48898b4dddcae29abb44e1b070a4e5")
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

