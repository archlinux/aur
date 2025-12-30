# Maintainer: Thomas Blair <https://github.com/ThomasB3143>

pkgname=teevee
pkgver=0.2.0
pkgrel=1
pkgdesc="Single-button cyclic launcher using dunst notifications"
arch=('any')
url="https://github.com/ThomasB3143/teevee"
license=('MIT')
depends=('bash' 'dunst')
source=("teevee-${pkgver}.tar.gz::https://github.com/ThomasB3143/teevee/archive/v${pkgver}.tar.gz")
sha256sums=('ddb0e3c2760ac47af79066e85980c5b7cf9ed4afe1fcb1c43ad350204e914c78')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Main executable
    install -Dm755 teevee "${pkgdir}/usr/bin/teevee"

    # Library files
    install -d "${pkgdir}/usr/share/teevee/lib"
    install -m644 lib/*.sh "${pkgdir}/usr/share/teevee/lib/"
}
