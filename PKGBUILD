# Maintainer: John Regan <john@jrjrtech.com>
_pkgname=appimage
pkgname="${_pkgname}-appimage"
pkgdesc="Generate, extract, and inspect AppImages - appimage version"
pkgver="13"
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
'df3baf5ca5facbecfc2f3fa6713c29ab9cefa8fd8c1eac5d283b79cab33e4acb'
'fd0e2c14a135e7741ef82649558150f141a04c280ed77a5c6f9ec733627e520e'
'328e0d745c5c6817048c27bc3e8314871703f8f47ffa81a37cb06cd95a94b323'
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
