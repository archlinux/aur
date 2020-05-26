# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.0
pkgrel=1
#epoch=
pkgdesc="A script that simplifies the creation of unified kernel images."
#url=""
license=('GPL3')
arch=('any')
groups=()
depends=('jq' 'mkinitcpio')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="makeuki.install"
#changelog=
source=("makeuki.tar.gz")
noextract=()
sha256sums=('89a9ab5cde8c979f26fb797b5e66f53f944e0e4e1e14e86d8cc1a22fa4678bf3')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
