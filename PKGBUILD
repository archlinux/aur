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
source=('50-emoji.conf')
sha256sums=('a6afa3d792fe92fa2bd20c19ffa8042de8aec24b3c8f0d2f1e8e00d809fd4079')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail/'
    local conf_d='usr/share/fontconfig/conf.default/'

    install -Dm655 "${source[0]}" -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/${source[0]}" "${pkgdir}/${conf_d}"
}
