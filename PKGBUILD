# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio"
pkgver="20.5.21.244"
pkgrel=1
pkgdesc="Audio compression tool for FLAC and Nero AAC"
arch=("any")
url="https://tari.in/www/software/${pkgname}"
license=("GPL3")
depends=("gst-python" "gst-plugins-base" "gst-libav" "python-html5lib" "python-beautifulsoup4" "python-lxml" "python-psutil" "flac" "cuetools" "shntool" "atomicparsley" "mac" "lsdvd" "mplayer" "odio-edit" "neroaacenc-bin" "libodiosacd")
makedepends=("bzr" "python-setuptools" "python-polib")
source=("bzr+lp:/${pkgname}/trunk")
md5sums=("SKIP")
options=("!emptydirs")

pkgver()
{
    cd trunk
    echo "$(cat ${pkgname}/appdata.py | grep APPVERSION | sed 's| ||g' | sed "s|'||g" | cut -f '2' -d '=').$(bzr revno)"
}

build()
{
    cd trunk
    python setup.py build
}

package()
{
    cd trunk
    python setup.py install --root="${pkgdir}" --optimize=1

}
