# Maintainer: Evan Goode <mail@evangoo.de>

pkgname=fjordlauncher-bin
pkgver=8.3.1
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('x86_64')
url="https://github.com/unmojang/FjordLauncher"
license=('GPL3')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('fjordlauncher')
conflicts=('fjordlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
)
source=("https://github.com/unmojang/FjordLauncher/releases/download/${pkgver}/FjordLauncher-Linux-Qt6-${pkgver}.tar.gz")
noextract=("FjordLauncher-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('af74b0aa49463672c082894709a4d9d55226acfa9329b321999f7767aa9d147f')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf FjordLauncher-Linux-Qt6-${pkgver}.tar.gz
    rm "${pkgdir}"/usr/bin/fjordlauncher_updater
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
