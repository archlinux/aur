# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=noto-fonts-devanagari-fontconfig
pkgver=1
pkgrel=1
pkgdesc='Fontconfig to fix Noto Fonts Devanagari fonts Ligatures.'
arch=('any')
license=('GPL')
depends=('noto-fonts')
optdepends=()
provides=('noto-fonts-devanagari-fontconfig')
conflicts=('noto-color-emoji-fontconfig-no-binding')
options=()
source=('50-noto-fonts-devanagari.conf')
sha256sums=('a9817cc0ef4f6ee5c6a13c52cbae7b61b40157c2f589ba57814863cb282e531a')

package() {
    local conf_avail='usr/share/fontconfig/conf.avail/'
    local conf_d='usr/share/fontconfig/conf.default/'

    install -Dm655 '50-noto-fonts-devanagari.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/50-noto-fonts-devanagari.conf" "${pkgdir}/${conf_d}"
}