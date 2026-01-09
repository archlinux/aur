# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=nhaccuatui
pkgver=2.0.0
pkgrel=1
pkgdesc="Nghe nhạc mọi lúc mọi nơi"
arch=('x86_64')
url="https://apps.nhaccuatui.com"
license=("LicenseRef-Nhaccuatui")
depends=(
    'glibc'
    'zlib-ng-compat'
)
options=(!strip)
source=(
    "http://apps.nhaccuatui.com/download/NhacCuaTui-${pkgver}.AppImage"
    "LICENSE.electron.txt"
    "nhaccuatui-desktop.png"
    "nhaccuatui.desktop"
)
sha256sums=(
    '0f48960234fbf094090eb54e8574803575bf71c6eeb9dbf5ab2cbdb95b26a666'
    '34f6f27c26d1bb8682ebb42ae401f558228fd608455bd7c6561d5fd500b7d05b'
    '345769d914aa7e09db98538a9278f7fa871de8fea2bec04c2e4f0ac4a032aa70'
    '44166dd75c7e5b46193eb830cf97b72829e8b7c2dd58c79befcbadf95c532b72'
)

package() {
    install -Dm644 "$srcdir/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "$srcdir/nhaccuatui-desktop.png" "$pkgdir/opt/${pkgname}/nhaccuatui-desktop.png"
    install -Dm644 "$srcdir/nhaccuatui.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "$srcdir/NhacCuaTui-${pkgver}.AppImage" "$pkgdir/opt/${pkgname}/nhaccuatui-desktop"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/nhaccuatui-desktop" "$pkgdir/usr/bin/${pkgname}"

}
