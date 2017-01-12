# Maintainer: fenuks

pkgname=svg2vd
pkgver=1.3
pkgrel=1
pkgdesc="Batch converter of SVG images to Android VectorDrawable XML resource files."
arch=("i686" "x86_64")
url="https://github.com/a-student/SvgToVectorDrawableConverter"
license=("MIT")
depends=("mono" "inkscape")
optdepends=()
makedepends=()  
conflicts=("${pkgname}")
# install=$pkgname.install
source=("${pkgname}-${pkgver}.zip::https://github.com/a-student/SvgToVectorDrawableConverter/releases/download/v${pkgver}/SvgToVectorDrawableConverter_v${pkgver}.zip")
sha256sums=('371dde90e3c9bb82f2827786ddb4c3c0d6fdeecf9ff27385581d30995121eb6b')

package() {
    cd "${srcdir}/"
    install -dm 755 "${pkgdir}/opt/svg2vd/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 644 -t "${pkgdir}/opt/svg2vd" BlankVectorDrawable{.ApiLevel24,.BetterVectorDrawable,.res-auto,}.xml
    install -Dm 755 svg2vd.exe "${pkgdir}/opt/svg2vd/svg2vd"
    ln -s /opt/svg2vd/svg2vd "${pkgdir}/usr/bin/svg2vd"
}
