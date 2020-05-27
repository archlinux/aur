# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.1
pkgrel=2
pkgdesc="A script that simplifies the creation of unified kernel images."
license=('GPL3')
arch=('any')
depends=('jq' 'mkinitcpio' 'pacman-contrib')
install="makeuki.install"
source=("makeuki.tar.gz")
sha256sums=('637c47bcd60afeea50da874e6c5e4c5ceec0f1d9fd82a6a3177cccd28afad169')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf.default"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
