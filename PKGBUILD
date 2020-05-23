# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=wluma-als-emulator
pkgver=1.1.0
pkgrel=1
pkgdesc="Ambient light sensor emulator for wluma"
license=(MIT)
url="https://github.com/cyrinux/${pkgname}"
optdepends=(
    'python-pillow: for webcam strategy',
    'ffmpeg: for webcam strategy'
)
arch=(any)
depends=('wluma')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('cb643dab7cbae5e82df59fbd2cf28fd76b87414fb806e89b37a924358d572fdc'
            'SKIP')
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
