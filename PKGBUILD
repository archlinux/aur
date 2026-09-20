# Maintainer: cap153 <1536989047@qq.com>

pkgname=stools-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal, fast, Fuzzel-style application launcher with pinyin support"
arch=('x86_64')
url="https://github.com/cap153/stools"
license=('MIT')
provides=('stools')
conflicts=('stools')
options=('!strip')

depends=(
    'glibc'
    'gcc-libs'
    'fontconfig'
    'freetype2'
    'libxkbcommon'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'wayland'
    'libglvnd'
)
optdepends=('mesa: OpenGL 驱动（使用 NVIDIA 专有驱动则不需要）')

source=(
    "stools-${pkgver}::https://github.com/cap153/stools/releases/download/v${pkgver}/stools"
    "stools.desktop"
    "stools.png"
    "LICENSE::https://raw.githubusercontent.com/cap153/stools/v${pkgver}/LICENSE"
)

# updpkgsums
sha256sums=('0e73922064425a4faa8c387260456b2d56df9662df429d2b5fb58ad59b60bd15'
            'c9ce99448e12a0efefde70a0d275e005362ec627d93242045d884b3f2cb492f5'
            '34eb566db977573133cc556dd6e6422dffdd11b7aed5035ec1184744b7837ae3'
            '26bc02acb6900eefb9bacdda0830b61b60f354c7b8e3b47a2f01a0c512eaeb39')

package() {
    install -Dm755 "${srcdir}/stools-${pkgver}" \
        "${pkgdir}/usr/bin/stools"

    install -Dm644 "${srcdir}/stools.desktop" \
        "${pkgdir}/usr/share/applications/stools.desktop"

    install -Dm644 "${srcdir}/stools.png" \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/stools.png"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# makepkg --printsrcinfo > .SRCINFO
