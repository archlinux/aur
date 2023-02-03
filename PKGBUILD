# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=prismlauncher-qt5-bin
pkgver=6.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('prismlauncher' 'prismlauncher-qt5')
conflicts=('prismlauncher' 'prismlauncher-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-${pkgver}.tar.gz")
sha256sums=('7443692df4603c63fd06d1a1415c8213b151f3448dccc2516abaf9862af6a69b')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PrismLauncher-Linux-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
