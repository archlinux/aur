# Maintainer: Kazoku <k4zoku@pm.me>
pkgname=tosu-overlay
pkgver=v2.0.0
pkgrel=1
pkgdesc="Overlay for osu! Powered by tosu, qt6 and qt6 webengine"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay-qt"
license=('MIT')
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt')
makedepends=('cmake' 'make' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("tosu-overlay::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

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

