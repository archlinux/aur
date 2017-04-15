pkgname=akasha-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A Next-Generation Social Media Network powered by the Ethereum world computer (Alpha)"
arch=("x86_64")
provides=(akasha)
url="https://akasha.world/"
license=("custom")
source=("https://github.com/AkashaProject/Alpha/releases/download/${pkgver}/AKASHA-linux-x64-${pkgver}.deb")
sha256sums=("fab35557dfcaddcd2c361cbc8fb376ea543832b688667be58c67883e3aa1e398")
depends=("gconf"
         "alsa-lib"
         "gcc-libs-multilib"
         "libxtst"
         "gtk2"
         "nss"
         "libxss")

package() {
    bsdtar xf data.tar.xz
    chmod -R g-w opt
    chmod -R g-w usr
    mv opt "${pkgdir}"
    mv usr "${pkgdir}"
}
