# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="20.7.24"
pkgrel=1
pkgdesc="Indicator and control applet for Apache"
arch=("any")
url="https://tari.in/www/software/lampswitch"
license=("GPL3")
depends=("gobject-introspection" "gtk3" "python-gobject" "libayatana-appindicator" "desktop-file-utils")
makedepends=("python-setuptools" "python-polib")
install="${pkgname}.install"
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("6dc061673ee5422c58247fb16a6c5a46")

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
