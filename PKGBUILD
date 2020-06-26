# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.2
pkgrel=4
pkgdesc="A script that simplifies the creation of unified kernel images."
license=('GPL3')
arch=('any')
depends=('jq' 'mkinitcpio' 'pacman-contrib')
install="makeuki.install"
source=("makeuki.tar.gz")
sha256sums=('4037ae37346e23d59690f7f45ea1ce89ee85b88f356614485fbef59fc62f8ebc')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf.default"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
