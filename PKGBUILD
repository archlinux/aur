# Maintainer: Andrew Relative <kezin636 at gmail dot com>
#
pkgname=davinci-alac-scripts
pkgver=1.0
pkgrel=1
pkgdesc="Davinci Scripts to convert your footage audio to ALAC (crouch)"
arch=('any')
url="https://github.com/GMDProjectL/davinci-alac-scripts"
license=('MIT')
depends=('python' 'ffmpeg')
makedepends=()
checkdepends=()
optdepends=()
backup=()
options=()
install=
source=(${pkgname}::"git+file://${PWD}")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    local DAS_SCRIPT_DIST="${pkgdir}/opt/resolve/Fusion/Scripts/Utility"
    local DAS_ALAC_CONVERTER_DIST="${pkgdir}/usr/bin"
    local AAC2ALACBIN="${DAS_ALAC_CONVERTER_DIST}/aac2alac"

    mkdir -p "${DAS_SCRIPT_DIST}"
    mkdir -p "${DAS_ALAC_CONVERTER_DIST}"

    install -Dm644 convert_aac_to_alac.py "${DAS_SCRIPT_DIST}/convert_aac_to_alac.py"
    install -Dm755 aac2alac.py "${AAC2ALACBIN}"
}
