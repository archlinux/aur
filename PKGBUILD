# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=formatfactory
pkgver=1.1.2
pkgrel=1
pkgdesc="万能格式转换器 - 视频/音频/图片/字体 一键转换"
arch=('x86_64')
url="https://github.com/maoyaotang12/FormatFactory"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'ffmpeg' 'imagemagick' 'fontforge' 'afdko')
makedepends=('cmake' 'gcc' 'make')
source=(git+$url.git
formatfactory.desktop
FormatFactory.svg
LICENSE)
sha256sums=('SKIP'
            '0cc6823f2a5d7e87ca18a470834818702bf41ef25deba86aeb05fbb220026be4'
            'c10a3c108944f6eee1bb876b59f391a3002aa102fe0e5be2744a3f7591161aff'
            '46ef102a35cb6843b675efed858efe2fe9d3af0d353ce2feeddfb66bc9dfd1ee')

package() {

    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "FormatFactory.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cd "${srcdir}/FormatFactory"
    install -Dm755 FormatFactory "${pkgdir}/usr/bin/FormatFactory"
}
