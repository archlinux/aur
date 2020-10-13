# Maintainer: John Regan <john@jrjrtech.com>
_pkgname=appimage
pkgname="${_pkgname}-appimage"
pkgdesc="Generate, extract, and inspect AppImages - appimage version"
pkgver="12"
pkgrel=1
arch=('x86_64')
url="https://github.com/AppImage/AppImageKit"
license=('MIT')
options=(!strip)
optdepends=('appstream')
source_x86_64=(
"appimagetool::${url}/releases/download/${pkgver}/appimagetool-x86_64.AppImage"
"AppRun::${url}/releases/download/${pkgver}/AppRun-x86_64"
"runtime::${url}/releases/download/${pkgver}/runtime-x86_64"
)
noextract=('appimagetool' 'AppRun' 'runtime')
sha256sums_x86_64=(
'd918b4df547b388ef253f3c9e7f6529ca81a885395c31f619d9aaf7030499a13'
'e8f44f56bb23e105905850250d9d87fb1a5cf64211ad141b85864b1b7a092332'
'24da8e0e149b7211cbfb00a545189a1101cb18d1f27d4cfc1895837d2c30bc30'
)

conflicts=('appimage-git')
provides=('appimage')

prepare() {
    chmod +x appimagetool AppRun runtime
}

package() {
    install -Dm755 "${srcdir}/appimagetool" "${pkgdir}/usr/bin/appimagetool"
    install -Dm755 "${srcdir}/AppRun" "${pkgdir}/usr/share/appimage/AppRun"
    install -Dm755 "${srcdir}/runtime" "${pkgdir}/usr/share/appimage/runtime"
}
