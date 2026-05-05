# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=formatfactory
pkgver=1.0.1
pkgrel=1
pkgdesc="万能格式转换器 - 视频/音频/图片/字体 一键转换"
arch=('x86_64')
url="https://github.com/maoyaotang12/FormatFactory"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'ffmpeg' 'opencv' 'fontforge')
makedepends=('cmake' 'gcc' 'make')
source=(git+$url.git)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/FormatFactory"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd "${srcdir}/FormatFactory"
    install -Dm755 build/FormatFactory "${pkgdir}/usr/bin/FormatFactory"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "FormatFactory.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
