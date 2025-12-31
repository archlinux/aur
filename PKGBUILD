# Maintainer: Thomas Blair <https://github.com/ThomasB3143>

pkgname=teevee
pkgver=1.0.0
pkgrel=1
pkgdesc="Single-button cyclic launcher using dunst notifications"
arch=('any')
url="https://github.com/ThomasB3143/teevee"
license=('MIT')
depends=('bash' 'dunst')
source=("teevee-${pkgver}.tar.gz::https://github.com/ThomasB3143/teevee/archive/v${pkgver}.tar.gz")
sha256sums=('e18c41424519e1ee495c34993b287c5ef0a1cb512a931ace29912c7903e658a1')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Main executable
    install -Dm755 teevee "${pkgdir}/usr/bin/teevee"

    # Library files
    install -d "${pkgdir}/usr/share/teevee/lib"
    install -m644 lib/*.sh "${pkgdir}/usr/share/teevee/lib/"
}
