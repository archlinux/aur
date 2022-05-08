# Maintainer: Lenny McLennington <lenny@sneed.church>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=polymc-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-${pkgver}.tar.gz")
noextract=("PolyMC-Linux-${pkgver}.tar.gz")
sha256sums=('d82dbd52e7ebc82eba8123869ce660cdbb885da5267b6b79569b1bbd77c209cd')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PolyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
