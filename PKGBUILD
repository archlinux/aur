# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=0.1
_commit='0e435f633687d92a1a25099a12dd8f30a7094a96'
pkgrel=1
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://gitlab.com/brunelli/tools/blob/master/wl-clipboard-x11'
license=('GPL2')
arch=('any')
depends=('wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}_${_commit::7}"::"https://gitlab.com/brunelli/tools/raw/${_commit}/${pkgname}")
sha256sums=('053b2c9150d7fc4544df17e9ef6cfc5a982dc5c677f656ad47fa37bb369e3a8c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm0755 "${pkgname}_${_commit::7}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xclip"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xsel"
}
