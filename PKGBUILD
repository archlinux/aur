# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
epoch=1
pkgver=3.9.8.60034
pkgrel=1
pkgdesc="Insync context menus and overlay icons for Dolphin - Plasma 6"
arch=('x86_64')
url="https://www.insynchq.com/downloads"
license=('custom:insync')
depends=(
    'insync'
    'dolphin'
)
source=("https://cdn.insynchq.com/builds/linux/${pkgver}/insync-dolphin-kde6_${pkgver}_all.deb")
sha256sums=('093601ddc71db5f105b06af3d9ee8463abca38103486cb3b62a95809cf64c18a')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    mv "${pkgdir}/usr/lib/x86_64-linux-gnu/qt6" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
}
