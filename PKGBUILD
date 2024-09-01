# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio"
pkgver="24.9.1"
pkgrel=1
pkgdesc="Audio compression tool for FLAC and Nero AAC"
arch=("any")
url="https://tari.in/www/software/${pkgname}"
license=("GPL-3.0-or-later")
depends=("gstreamer" "gst-plugins-base-libs" "gst-plugins-good" "gst-plugins-bad" "gst-plugins-ugly" "gst-libav" "python-gobject" "python-cairo" "python-requests-html" "python-lxml-html-clean" "python-psutil" "python-mutagen" "odio-edit" "neroaacenc-bin" "libodiosacd" "lsdvd" "gtk3" "glib2" "hicolor-icon-theme" "gdk-pixbuf2" "pango" "dconf" "python")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("81c23be78d234b30122d863c525f144f")
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
