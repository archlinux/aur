# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=wluma-als-emulator
pkgver=1.0.0
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
sha256sums=('943f5fe76b9c493aa7c033876f4a5c65f8cc7b5d672b90eee682d8419ec666bf'
    'SKIP')
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
