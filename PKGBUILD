# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.51
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
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.sh::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-Linux.sh"
)
sha256sums=('977ef1217421ef1c39554d371c4cd03dabf140505db26cbc1df5288a2f482dff')
package () {
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    install -Dm755 -d "${pkgdir}/usr"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --skip-license
    chown root:root -R "${pkgdir}"
}
