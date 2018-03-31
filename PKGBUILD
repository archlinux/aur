# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_python="python2"
_name="qr-tools"
_subname="qrtools"
_ubuntur="0~23~ubuntu16.10.1"
pkgname="${_python}-${_subname}"
pkgver="1.4"
pkgrel="2"
pkgdesc="A high level library for reading and generating QR codes."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("${_python}" "${_python}-pillow" "${_python}-zbar" 'qrencode')
provides=("${pkgname}")
source=("https://launchpad.net/~${_name}-developers/+archive/ubuntu/daily/+files/python-${_subname}_${pkgver}-${_ubuntur}.tar.gz")
sha256sums=('dcbaaf10204696fff7c028415803247df1c8b99d3e1c21950144c14b1b5f8cfb')

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
