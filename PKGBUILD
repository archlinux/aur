# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=prismlauncher-qt5-bin
pkgver=5.0
pkgrel=4
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('prismlauncher' 'polymc' 'polymc-qt5')
conflicts=('prismlauncher' 'polymc' 'polymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-${pkgver}.tar.gz")
noextract=("PrismLauncher-Linux-${pkgver}.tar.gz")
sha256sums=('7e5f8753134418a65ab11043563cb45880c0adc5a2c1a5c2897dd9de068e2e39')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PrismLauncher-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
