# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wl-clipboard-x11
pkgver=0.1
_commit='5024cc30d1a26fc0ad3da1547da694e2365a66d0'
pkgrel=1
pkgdesc='A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools'
url='https://gitlab.com/brunelli/tools/blob/master/wl-clipboard-x11'
license=('GPL2')
arch=('any')
depends=('wl-clipboard')
provides=('xclip' 'xsel')
conflicts=('xclip' 'xsel')
source=("https://gitlab.com/brunelli/tools/raw/${_commit}/${pkgname}")
sha256sums=('63fd6d60723d24e572c74c73382965ec35b01db51e5de6da53fceed7694fa5b3')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm0755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xclip"
    ln -s /usr/bin/${pkgname} "${pkgdir}/usr/bin/xsel"
}
