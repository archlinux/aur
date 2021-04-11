# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="caja-rename"
pkgver="21.4.11"
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=("any")
url="https://tari.in/www/software/caja-rename"
license=("GPL3")
depends=("caja" "python-caja" "python" "python-gobject" "gobject-introspection" "gtk3")
makedepends=("python-setuptools" "python-polib")
install="${pkgname}.install"
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("75a86fe9b619d6419f3c5ad7d8eefaf8")
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
