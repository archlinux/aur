# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: seth <getchoo at tuta dot io>

pkgname=prismlauncher-bin
pkgver=7.1
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('prismlauncher')
conflicts=('prismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
)
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-Qt6-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('5a2785cd46762d724824e06afd0ceca6ddd9b3fc91219a54ee80047bf02e92b4')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PrismLauncher-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
