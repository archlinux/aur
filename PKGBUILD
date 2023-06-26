# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: seth <getchoo at tuta dot io>

pkgname=prismlauncher-qt5-bin
pkgver=7.1
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime=17' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('prismlauncher' 'prismlauncher-qt5')
conflicts=('prismlauncher' 'prismlauncher-qt5')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
)
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-${pkgver}.tar.gz")
sha256sums=('08d3be162e5a4f1b3dc0ef11453ed339c8b2371500633687e33acc3d51062fa5')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PrismLauncher-Linux-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
