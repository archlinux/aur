# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=emoji-fontconfig
pkgver=1.0.0
pkgrel=1
pkgdesc='fontconfig to enable a Emoji(pictogram) font that can display Emoji(pictograms).'
arch=('any')
license=('CC-PDDC')
depends=()
optdepends=()
provides=('emoji-fontconfig')
conflicts=()
options=()
source=('90-emoji.conf')
sha256sums=('5a89a1b452835e647be6b267fff0f4c8fd3b06387697bc28582250b65911fc04')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail/'
    local conf_d='usr/share/fontconfig/conf.default/'

    install -Dm655 '90-emoji.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/90-emoji.conf" "${pkgdir}/${conf_d}"
}
