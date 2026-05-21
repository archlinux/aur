# Maintainer: unassignedthread <unassignedthread@github.com>
pkgname=fluxpass
pkgver=1.0.0
pkgrel=4
pkgdesc="GUI password manager for pass (passwordstore.org) with type-based entries"
arch=('any')
url="https://github.com/unassignedthread/FluxPass"
license=('MIT')
depends=('java-runtime>=17' 'pass' 'gnupg')
_jfxver=22.0.1
source=(
    "${pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${pkgname}.jar"
    "${pkgname}.sh::${url}/raw/v${pkgver}/${pkgname}.sh"
    "${pkgname}.desktop::${url}/raw/v${pkgver}/${pkgname}.desktop"
    "${pkgname}.svg::${url}/raw/v${pkgver}/${pkgname}.svg"
    "javafx-base-${_jfxver}-linux.jar::https://repo1.maven.org/maven2/org/openjfx/javafx-base/${_jfxver}/javafx-base-${_jfxver}-linux.jar"
    "javafx-controls-${_jfxver}-linux.jar::https://repo1.maven.org/maven2/org/openjfx/javafx-controls/${_jfxver}/javafx-controls-${_jfxver}-linux.jar"
    "javafx-graphics-${_jfxver}-linux.jar::https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/${_jfxver}/javafx-graphics-${_jfxver}-linux.jar"
    "javafx-fxml-${_jfxver}-linux.jar::https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/${_jfxver}/javafx-fxml-${_jfxver}-linux.jar"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    local _libdir="${pkgdir}/usr/share/java/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${_libdir}/${pkgname}.jar"
    install -Dm644 "${srcdir}/javafx-base-${_jfxver}-linux.jar"       "${_libdir}/lib/javafx-base.jar"
    install -Dm644 "${srcdir}/javafx-controls-${_jfxver}-linux.jar"   "${_libdir}/lib/javafx-controls.jar"
    install -Dm644 "${srcdir}/javafx-graphics-${_jfxver}-linux.jar"   "${_libdir}/lib/javafx-graphics.jar"
    install -Dm644 "${srcdir}/javafx-fxml-${_jfxver}-linux.jar"       "${_libdir}/lib/javafx-fxml.jar"

    install -Dm755 "${srcdir}/${pkgname}.sh"        "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop"   "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.svg"       "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
