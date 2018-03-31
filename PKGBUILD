# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_python="python2"
_name="qr-tools"
_subname="qrtools"
_ubuntur="0~29~ubuntu17.10.1"
pkgname="${_python}-${_subname}"
pkgver="1.4"
pkgrel="3"
pkgdesc="A high level library for reading and generating QR codes."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("${_python}" "${_python}-pillow" "${_python}-zbar" 'qrencode')
provides=("${pkgname}")
source=("https://launchpad.net/~${_name}-developers/+archive/ubuntu/daily/+files/python-${_subname}_${pkgver}-${_ubuntur}.tar.gz")
sha256sums=('ccd7c666eaf1745f7af7e21cec1241283256fddcc780b254c3d1654e560a65cb')

build() {
    cd "python-${_subname}-${pkgver}"
    sed -i 's|env python|env python2|' "${_subname}.py"
}

package() {
    cd "python-${_subname}-${pkgver}"
    install -d ${pkgdir}/usr/lib/python2.7/site-packages
    install -m 644 qrtools.py ${pkgdir}/usr/lib/python2.7/site-packages
}

# vim:set ts=4 sw=2 ft=sh et:
