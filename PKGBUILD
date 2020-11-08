# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-settings"
pkgver="20.10.14"
pkgrel=1
pkgdesc="Configuration tool for tweaking all Ayatana system indicators"
arch=("any")
url="https://github.com/AyatanaIndicators/ayatana-settings"
license=("GPL3")
depends=("gtk3" "gobject-introspection" "python-psutil")
makedepends=("python-setuptools" "python-polib")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("14ee7da6a43912b8b4cea8f9d5f23fe9")
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

