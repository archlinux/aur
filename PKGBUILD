# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-bin
pkgver=6.1
pkgrel=2
pkgdesc="Minecraft launcher with the ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'qt6-charts' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-Qt6-${pkgver}.tar.gz")
noextract=("PolyMC-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('ab8114c8c406301b22ab0f5aa68dea821f9dbe8173508972dd2ec17f8a129b36')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
