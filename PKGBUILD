# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-bin
pkgver=6.0
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
sha256sums=('a4f06a2b0c2e94a2d44c05753146160b1a7a400df9afd744ae1672db50b94c52')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
