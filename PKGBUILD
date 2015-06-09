# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_python="python2"
_name="qr-tools"
_subname="qrtools"

pkgname="${_python}-${_subname}"
pkgver="1.2"
pkgrel="4"
pkgdesc="A high level library for reading and generating QR codes."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("${_python}" "${_python}-pillow" "zbar" 'qrencode')
provides=("${pkgname}")
source=("https://launchpad.net/${_name}/trunk/${pkgver}/+download/${_name}-${pkgver}.tar.gz")
md5sums=('07bd6018e2325dd29acb5f7623b3e018')

build() {
    cd "${_name}"
    
    sed -i 's|env python|env python2|' "${_subname}.py"
    sed -i 's|import Image|from PIL import Image|' "${_subname}.py"
}

package() {
    cd "${_name}"

    install -d ${pkgdir}/usr/lib/python2.7/site-packages
    install -m 644 qrtools.py ${pkgdir}/usr/lib/python2.7/site-packages    
}
