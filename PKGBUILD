# Maintainer: fenuks

pkgname=svg2vd
pkgver=1.4
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
sha256sums=('956dddf9d8488ced7ced3f95c64f58d45aec59e2a7fb92069d7e3b2da5da7b15')

package() {
    cd "${srcdir}/"
    install -dm 755 "${pkgdir}/opt/svg2vd/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 644 -t "${pkgdir}/opt/svg2vd" BlankVectorDrawable{.ApiLevel24,.BetterVectorDrawable,.res-auto,}.xml
    install -Dm 755 svg2vd.exe "${pkgdir}/opt/svg2vd/svg2vd"
    ln -s /opt/svg2vd/svg2vd "${pkgdir}/usr/bin/svg2vd"
}
