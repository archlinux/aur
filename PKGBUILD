# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="23.10.13"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("any")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL3")
depends=("gtk3" "gobject-introspection" "python-psutil")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("2a2433c4120e84af3e9b7fecf39062a6")
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

