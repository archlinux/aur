# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="20.11.09.1"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("any")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL3")
depends=("gtk3" "gobject-introspection" "python-psutil")
makedepends=("python-setuptools" "python-polib")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("19e3b8afc4922eb1fe17c8d78d86db1b")
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

