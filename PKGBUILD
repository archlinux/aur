# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.1
pkgrel=1
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
sha256sums=('130e86bd7fe4eccbaf43787c325c00d1ba709ae3e4c2c012310ace89fc717b43')
package () {
    install -Dm755 -d "${pkgdir}/usr"
    chmod 755 "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
    chown root:root -R "${pkgdir}"
}