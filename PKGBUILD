# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="22.9.9"
pkgrel=1
pkgdesc="Indicator and control applet for web services"
arch=("any")
url="https://tari.in/www/software/lampswitch"
license=("GPL3")
depends=("gobject-introspection" "gtk3" "python-gobject" "libayatana-appindicator" "desktop-file-utils")
makedepends=("python-setuptools" "python-polib")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("854a1d356df42a6373be7ef4f5782eb4")

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
