# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=0.1
_commit='48cab54acc933c3b800fd2581ef5ec326242c705'
pkgrel=3
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://gitlab.com/brunelli/tools/blob/master/wl-clipboard-x11'
license=('GPL2')
arch=('any')
depends=('wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("${pkgname}_${_commit::7}"::"https://gitlab.com/brunelli/tools/raw/${_commit}/${pkgname}")
sha256sums=('f5d2f76019cda476fdacbe3fbc83dd1ae550d98e271a492762ea4a023fc0eb6f')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/${pkgname}/"
    install -Dm0755 "${pkgname}_${_commit::7}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
    ln -s /usr/share/${pkgname}/${pkgname} "${pkgdir}/usr/bin/xclip"
    ln -s /usr/share/${pkgname}/${pkgname} "${pkgdir}/usr/bin/xsel"
}
