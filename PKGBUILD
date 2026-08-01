# Maintainer: KDLoww <wsgsb555@outlook.com> | https://github.com/Pony-CW
# Contributor: Reylyer <reylyercross@shariyl.cloud> | https://github.com/Reylyer
# With the help of Thomas <thomas@vypxl.io>

# Package name
pkgname=linuxdeploy-appimage

# Version
pkgver=1.alpha.20251107.1
pkgrel=2

# Generic
pkgdesc="AppDir creation and maintenance tool. Featuring flexible plugin system."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/linuxdeploy/linuxdeploy"
license=('MIT')

# Dependencies
depends=(fuse2)

# Package relations
conflicts=("linuxdeploy")
provides=("linuxdeploy")

# Others
options=(!strip)

# Sources
source=("LICENSE::https://raw.githubusercontent.com/linuxdeploy/linuxdeploy/refs/tags/${pkgver//./-}/LICENSE.txt")
source_x86_64=("linuxdeploy-x86_64.AppImage::${url}/releases/download/${pkgver//./-}/linuxdeploy-x86_64.AppImage")
source_i686=("linuxdeploy-i386.AppImage::${url}/releases/download/${pkgver//./-}/linuxdeploy-i386.AppImage")
source_aarch64=("linuxdeploy-aarch64.AppImage::${url}/releases/download/${pkgver//./-}/linuxdeploy-aarch64.AppImage")
source_armv7h=("linuxdeploy-armhf.AppImage::${url}/releases/download/${pkgver//./-}/linuxdeploy-armhf.AppImage")
sha256sums=('1edb41ae7601854ae15d113c3700beebd0ea3ed05b85e3786a94a72bb9916091')
sha256sums_x86_64=('c20cd71e3a4e3b80c3483cef793cda3f4e990aca14014d23c544ca3ce1270b4d')
sha256sums_i686=('a2a88d142aac42db779483ca07c10dbf318b27f514691107fc88a202faae17b5')
sha256sums_aarch64=('620095110d693282b8ebeb244a95b5e911cf8f65f76c88b4b47d16ae6346fcff')
sha256sums_armv7h=('e359161979fa4bee50b92ce7102fb510299caebf34f711d983fba7a8f4bb1c2e')


package() {
    case "${CARCH}" in
        i686)   _uparch="i386" ;;
        armv7h) _uparch="armhf" ;;
        *)      _uparch="${CARCH}" ;;
    esac

    install -Dm755 "linuxdeploy-${_uparch}.AppImage" "${pkgdir}/usr/bin/linuxdeploy"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
