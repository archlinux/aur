# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.2
pkgrel=2
pkgdesc="A script that simplifies the creation of unified kernel images."
license=('GPL3')
arch=('any')
depends=('jq' 'mkinitcpio' 'pacman-contrib')
install="makeuki.install"
source=("makeuki.tar.gz")
sha256sums=('fb4b94245383931d7983856333646fc8c618eb3ac6533b805353f2e59a91fd5c')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf.default"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
