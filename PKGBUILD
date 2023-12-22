# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-qt5-bin
pkgver=6.0
pkgrel=2
pkgdesc="Minecraft launcher with the ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'qt5-charts' 'zlib' 'hicolor-icon-theme')
provides=('polymc' 'polymc-qt5')
conflicts=('polymc' 'polymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-${pkgver}.tar.gz")
noextract=("PolyMC-Linux-${pkgver}.tar.gz")
sha256sums=('afc9d241afa9d85babed1dd9c51d10ccf87dde501bd35982ccaba611178ca17a')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
