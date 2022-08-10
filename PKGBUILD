pkgname=webcord-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!emptydirs')

_archive="webcord-${pkgver}-1.x86_64.rpm"

source=("${_archive}::${url}/releases/download/v${pkgver}/${_archive}")
sha256sums=('e3f9c6569c852e61d26d2cccfd9e155a25ba8560d75fbd9602b3581a227c1cb9')
noextract=("${_archive}")

package() {
    cd "${srcdir}"
    bsdtar -C "${pkgdir}" \
        -xf "${_archive}" \
        --exclude=".build-id" \
        --no-same-owner --no-same-permissions
}
