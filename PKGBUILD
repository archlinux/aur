# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=aseprite-darkflat-theme
pkgver=1.4
pkgrel=1
pkgdesc="Dark & flat theme for Aseprite"
arch=('any')
url="https://github.com/michidk/Aseprite-DarkFlat-Theme"
license=('custom')
depends=('aseprite')
source=("https://github.com/michidk/Aseprite-DarkFlat-Theme/archive/v${pkgver}/v${pkgver}.tar.gz")
md5sums=('2e624f50a2dc70bb24732f54e57fd259')

package() {
    cd "Aseprite-DarkFlat-Theme-${pkgver}"

    install -d -m755 "${pkgdir}/usr/share/aseprite/data/skins/Aseprite-DarkFlat-Theme"
    cp -r * "${pkgdir}/usr/share/aseprite/data/skins/Aseprite-DarkFlat-Theme"
    find "${pkgdir}/usr/share/aseprite/data/skins/Aseprite-DarkFlat-Theme" -type f -print0 | xargs -0 chmod 0644
    find "${pkgdir}/usr/share/aseprite/data/skins/Aseprite-DarkFlat-Theme" -type d -print0 | xargs -0 chmod 0755

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -n '/This theme is based/,/ this project, too./p' README.md > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    chmod 0644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
