# Maintainer: Thomas Blair <https://github.com/ThomasB3143>

pkgname=teevee
pkgver=1.0.3
pkgrel=1
pkgdesc="Single-button cyclic launcher using dunst notifications"
arch=('any')
url="https://github.com/ThomasB3143/teevee"
license=('MIT')
depends=('bash' 'dunst')
source=("teevee-${pkgver}.tar.gz::https://github.com/ThomasB3143/teevee/archive/v${pkgver}.tar.gz")
sha256sums=('f9d8065eac5c6069848d52c067ab4628c669e67026812956fb3a23ee44196a3b')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Main executable
    install -Dm755 teevee "${pkgdir}/usr/bin/teevee"

    # Library files
    install -d "${pkgdir}/usr/share/teevee/lib"
    install -m644 lib/*.sh "${pkgdir}/usr/share/teevee/lib/"
}
