# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="lampswitch"
pkgver="23.12.1"
pkgrel=1
pkgdesc="Indicator and control applet for web services"
arch=("any")
url="https://tari.in/www/software/lampswitch"
license=("GPL-3.0-or-later")
depends=("gtk3" "python-gobject" "libayatana-appindicator" "python-psutil" "hicolor-icon-theme" "python" "glib2" "gdk-pixbuf2" "bash")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("b4f13c6b496d37324089dc3ad760698e")

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
