# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=noto-fonts-devanagari-fontconfig
pkgver=2
pkgrel=1
pkgdesc='Fontconfig to fix Noto Fonts Devanagari fonts Ligatures.'
arch=('any')
license=('GPL')
depends=('noto-fonts')
optdepends=()
provides=('noto-fonts-devanagari-fontconfig')
options=()
source=('50-noto-fonts-devanagari.conf')
sha256sums=('77f404256d3364547c1e65cc38cdd6fde9107a8573f302fe29db497a324cac7c')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail/'
    local conf_d='usr/share/fontconfig/conf.default/'

    install -Dm655 '50-noto-fonts-devanagari.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/50-noto-fonts-devanagari.conf" "${pkgdir}/${conf_d}"
}
