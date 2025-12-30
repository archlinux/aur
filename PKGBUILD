# Maintainer: Thomas Blair <https://github.com/ThomasB3143>

pkgname=teevee
pkgver=0.1.0
pkgrel=1
pkgdesc="Single-button cyclic launcher using dunst notifications"
arch=('any')
url="https://github.com/ThomasB3143/teevee"
license=('MIT')
depends=('bash' 'dunst')
source=("teevee-${pkgver}.tar.gz::https://github.com/ThomasB3143/teevee/archive/v${pkgver}.tar.gz")
sha256sums=('ce46007678bd99f32a737df453d6cf71fadb76ca2c13d7fdd238e68de7224ac5')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Main executable
    install -Dm755 teevee "${pkgdir}/usr/bin/teevee"

    # Library files
    install -d "${pkgdir}/usr/share/teevee/lib"
    install -m644 lib/*.sh "${pkgdir}/usr/share/teevee/lib/"
}
