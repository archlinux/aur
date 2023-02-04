# Maintainer: Lenny McLennington <lenny@sneed.church>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=polymc-qt5-bin
pkgver=5.0
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc' 'polymc-qt5')
conflicts=('polymc' 'polymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-${pkgver}.tar.gz")
noextract=("PolyMC-Linux-${pkgver}.tar.gz")
sha256sums=('e82d614fdccb8a61e03f9b0e079965bba676d77ef8187be9c8d9a4dd24d9a796')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
