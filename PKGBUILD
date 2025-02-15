# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-qt5-bin
pkgver=7.0
pkgrel=1
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
sha256sums=('c19e6cda127d95852f3f5e62b0503962908d9002a3bbd691456e66edac87415c')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
