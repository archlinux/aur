# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=nerd-fonts-fontconfig
pkgver=1.0.1
pkgrel=2
pkgdesc='Fontconfig for Nerd Fonts Symbols'
arch=('any')
license=('MIT')
depends=('ttf-nerd-fonts-symbols-2048-em')
optdepends=()
conflicts=()
options=()
source=('75-symbol-nerd-fonts.conf')
sha256sums=('9d5057b1d18282967dd36cb427a35d75022352d17cda083f4b87a71b0f14eba2')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail'
    local conf_d='etc/fonts/conf.d/'

    install -Dm655 '75-symbol-nerd-fonts.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/75-symbol-nerd-fonts.conf" "${pkgdir}/${conf_d}"
}
