# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.6
pkgrel=1
pkgdesc="An open source Sheet Music MIDI Compiler.(Prebuilt version)"
arch=('x86_64')
url="http://werckme.github.io"
_ghurl="https://github.com/werckme/werckmeister"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libgcc'
    'libstdc++'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.sh::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.sh"
)
sha256sums=('46836dbf568aab37647280ba798ff89b51f8bb57f8f9fb45632f800e5d221fc5')
package () {
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    install -Dm755 -d "${pkgdir}/usr"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --skip-license
    chown root:root -R "${pkgdir}"
}
