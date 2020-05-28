# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='makeuki'
pkgver=v1.1
pkgrel=3
pkgdesc="A script that simplifies the creation of unified kernel images."
license=('GPL3')
arch=('any')
depends=('jq' 'mkinitcpio' 'pacman-contrib')
install="makeuki.install"
source=("makeuki.tar.gz")
sha256sums=('f87a2e98efa11f7811cd17d09a3b58ed961088b6ab8b9bc22404cb43d87c85e0')

package() {
    cd "${srcdir}"
    install -Dm755 makeuki.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 makeuki.conf.default "${pkgdir}/etc/${pkgname}/makeuki.conf.default"
    install -Dm755 makeuki.preset "${pkgdir}/etc/mkinitcpio.d/makeuki.preset"
    install -Dm755 90-mkinitcpio-install.hook "${pkgdir}/etc/pacman.d/hooks/90-mkinitcpio-install.hook"
    install -Dm755 ucode.hook "${pkgdir}/etc/pacman.d/hooks/ucode.hook"
}
