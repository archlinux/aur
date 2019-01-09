# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=0.1
_commit='81afcefcb27848845bc4e39e9d157f72f4905761'
pkgrel=2
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://gitlab.com/brunelli/tools/blob/master/wl-clipboard-x11'
license=('GPL2')
arch=('any')
depends=('wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}_${_commit::7}"::"https://gitlab.com/brunelli/tools/raw/${_commit}/${pkgname}")
sha256sums=('87605bea63821d4329dda01375070d78fb580f883f3b9176b4c0d852ef6e88c1')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm0755 "${pkgname}_${_commit::7}" "${pkgdir}/usr/bin/${pkgname}"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xclip"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xsel"
}
