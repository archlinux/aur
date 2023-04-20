# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bssenglish-bin
#_appname=ttmz
pkgver=2.0
pkgrel=1
pkgdesc="白杉树背单词训练软件."
arch=('x86_64')
url="https://bailplus.github.io/bssenglish.pages/"
_githuburl="https://github.com/BailPlus/bssenglish"
license=('GPL3')
provides=()
conflicts=("${pkgname%-bin}")
depends=('python' 'python-requests')
options=()
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}_65/${pkgname%-bin}_v${pkgver}_linux.deb")
sha256sums=('5a0c4292539f8c6f698fa2487ca626adb3014f5a835bec2431886e8dc6d51c4d')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/usr/share/licneses/"
    mv "${pkgdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/share/licneses/${pkgname}"
}