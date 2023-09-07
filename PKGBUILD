# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="An open source Sheet Music MIDI Compiler"
arch=('x86_64')
url="http://werckme.github.io"
_githuburl="https://github.com/werckme/werckmeister"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'glibc' 'gcc-libs')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.sh::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.sh")
sha256sums=('e49954bec9831d09bcebaa1613c3bfbf97d3c9b7b055492c2255deff419319ef')
package () {
    install -Dm755 -d "${pkgdir}/usr"
    chmod 755 "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
    chown root:root -R "${pkgdir}"
}