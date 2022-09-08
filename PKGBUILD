# Maintainer: Lenny McLennington <lenny@sneed.church>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=polymc-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-Qt6-${pkgver}.tar.gz")
noextract=("PolyMC-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('6958a77c5b99a8c1ec1b1ef50982c8668f076c29c450b796b5a0aeb33ac8a95c')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
