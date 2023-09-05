# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename"
pkgver="23.9.1"
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=("any")
url="https://tari.in/www/software/caja-rename"
license=("GPL3")
depends=("caja" "python-caja" "python" "python-gobject" "gobject-introspection" "gtk3")
makedepends=("python-setuptools" "python-polib")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("cc0b69927177bb0cbe5468d0881e9fdf")
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
