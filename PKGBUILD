# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=prismlauncher-bin
pkgver=6.0
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('prismlauncher')
conflicts=('prismlauncher')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-Qt6-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('4b1f32d3c13ae01acd69837571161649c9d693747bb57e587b826c1fe9dd8087')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PrismLauncher-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # fils in tarball are not owned by root
}
