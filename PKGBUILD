# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio"
pkgver="23.4.1"
pkgrel=1
pkgdesc="Audio compression tool for FLAC and Nero AAC"
arch=("any")
url="https://tari.in/www/software/${pkgname}"
license=("GPL3")
install="${pkgname}.install"
depends=("gst-plugins-good" "gst-plugins-bad" "gst-plugins-ugly" "gst-libav" "python-beautifulsoup4" "python-psutil" "python-mutagen" "odio-edit" "neroaacenc-bin" "libodiosacd" "lsdvd")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("91fb97893aa399a46e598525154018b1")
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
