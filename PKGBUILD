# Maintainer: yichun822 <yichun822@outlook.com>
pkgname=bshit
pkgver=1.0.0
pkgrel=1
url=https://github.com/yichun822/Bshit
makedepends=(git cmake ninja)
pkgdesc="你看你大坝进度条的cpp实现"
arch=("x86_64")
depends=(ffmpeg qt6-base)
license=("GPL-3.0")
source=("${pkgname}::git+https://github.com/yichun822/Bshit.git#branch=master"
        "Bshit.desktop"
        "Bshit.png")
sha256sums=('SKIP'
            'a5a49e87cc7a76315a4665a042851b453c1d028dfc5954c8332099bcaa3daba1'
            '75628950c6b5a0be7e2dbeea1f7a37b4bf037c71a1db099902bdd91ea7d9694c')

build(){
    cmake -B build -S "${srcdir}/${pkgname}" -G Ninja -D CMAKE_BUILD_TYPE=Release
    cmake --build ${srcdir}/build
}

package(){
    install -d ${pkgdir}/usr/local/bin
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "Bshit.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/Bshit.png"
    install -Dm644 "Bshit.desktop" "${pkgdir}/usr/share/applications/Bshit.desktop"
}
