# Maintainer: Kazoku <k4zoku@pm.me>
pkgname=tosu-overlay
pkgver=v2.0.0
pkgrel=2
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
makedepends=('cmake' 'make' 'gcc')
_tag=434472bb7a24d1aa177527ec94d25802560fdc85
source=("tosu-overlay::git+${url}.git#tag=${_tag}")
sha256sums=('860ff799f82220c55c7a9b9cba3659934769bc42291c22e7680086ebd7c8d86d')

build() {
    cd "${srcdir}/${pkgname}"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "src/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "distributions/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

