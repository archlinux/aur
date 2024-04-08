# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=werckmeister-bin
pkgver=1.4.3
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
sha256sums=('9faf76c5f031e45b3c63e7d9dfce4b5fd974ac49300dc65fee4d2d339847ae81')
package () {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.sh"
    install -Dm755 -d "${pkgdir}/usr"
    "${srcdir}/${pkgname%-bin}-${pkgver}.sh" --prefix="${pkgdir}/usr" --exclude-subdir --skip-license
    chown root:root -R "${pkgdir}"
}