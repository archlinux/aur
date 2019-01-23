# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=0.1
_commit='97821021fc2151fb85067a28ef0cf36f05cdd7c8'
pkgrel=4
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://gitlab.com/brunelli/tools/blob/master/wl-clipboard-x11'
license=('GPL2')
arch=('any')
depends=('wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}_${_commit::7}"::"https://gitlab.com/brunelli/tools/raw/${_commit}/${pkgname}")
sha256sums=('c6c3c11f470f330a9c844d354a52d64f674a48de3cb2f6359c8fa5b034a47825')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    install -Dm0755 "${pkgname}_${_commit::7}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
    ln -s /usr/share/${pkgname}/${pkgname} "${pkgdir}/usr/bin/xclip"
    ln -s /usr/share/${pkgname}/${pkgname} "${pkgdir}/usr/bin/xsel"
}
