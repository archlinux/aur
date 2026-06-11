# Maintainer: Makar986 <wmakar986@gmail.com>
pkgname=prismlauncher-fixes-additions-bin
_pkgname=PrismLauncher
pkgver=1.0.0
pkgrel=1
pkgdesc="Prism Launcher with custom fixes and offline-mode bypass (Precompiled-bin)"
arch=('x86_64')
url="https://github.com/Makar986/PrismLauncher-Fixes-Additions"
license=('GPL-3.0-only')

depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-5compat'
    'qt6-imageformats'
    'cmark'
    'libarchive'
    'qrencode'
    'tomlplusplus'
    'zlib'
    'hicolor-icon-theme'
)

optdepends=(
    'java-runtime>=17: Для запуска самого Minecraft (рекомендуется jre17-openjdk или jre21-openjdk)'
)

provides=('prismlauncher')
conflicts=('prismlauncher' 'prismlauncher-git' 'prismlauncher-qt5-bin')

source=("https://github.com/Makar986/PrismLauncher-Fixes-Additions/releases/download/v${pkgver}/PrismLauncher-Linux-Qt6-Portable-v${pkgver}.tar.gz")
sha256sums=('f0c5e21815634258b88ab2ba8df2bee47028c48bc57c330ff27a026c46eddc19')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    if [ -d "${srcdir}/usr/bin" ]; then
        cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    fi

    if [ -d "${srcdir}/usr/lib" ]; then
        cp -r "${srcdir}/usr/lib/." "${pkgdir}/usr/lib/"
    fi

    if [ -d "${srcdir}/usr/share/icons" ]; then
        cp -r "${srcdir}/usr/share/icons/." "${pkgdir}/usr/share/icons/"
    fi

    if [ -d "${srcdir}/usr/share/applications" ]; then
        cp -r "${srcdir}/usr/share/applications/." "${pkgdir}/usr/share/applications/"
    fi
}
