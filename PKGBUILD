# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=blobmoji-fontconfig
pkgver=1.0.0
pkgrel=2
pkgdesc='Fontconfig to enable Blobmoji fonts where emojis can be displayed'
arch=('any')
license=('GPL')
depends=('noto-fonts-emoji-blob')
optdepends=()
conflicts=()
options=()
source=('75-blobmoji.conf')
sha256sums=('4628bfc996088fe1ac48b8a9c2b3608e6b0e790fdb3ca1da9a24b7c1dc329d26')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail'
    local conf_d='etc/fonts/conf.d/'

    install -Dm655 '75-blobmoji.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/75-blobmoji.conf" "${pkgdir}/${conf_d}"
}
