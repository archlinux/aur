# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.1
pkgrel=1
pkgdesc="A script that simplifies the creation of unified kernel images."
license=('GPL3')
arch=('any')
depends=('jq' 'mkinitcpio' 'pacman-contrib')
install="makeuki.install"
source=("makeuki.tar.gz")
sha256sums=('0add34188fe2e96b9860d1c17e154ef538353f1db485d039745a4d3e46183eb2')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
