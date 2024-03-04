# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="An open source Sheet Music MIDI Compiler"
arch=('x86_64')
url="http://werckme.github.io"
_ghurl="https://github.com/werckme/werckmeister"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.sh::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.sh"
)
sha256sums=('4d49aee93c3cbb02fd07aa2845746f17bdf9caf6b40c7f04f692822758f73ad1')
package () {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    install -Dm755 -d "${pkgdir}/usr"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
    chown root:root -R "${pkgdir}"
}