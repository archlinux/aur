# Maintainer: lakejason0 <lakesarchive@outlook.com>

pkgname=noto-color-emoji-fontconfig-no-binding
pkgver=1.0.0
pkgrel=1
pkgdesc='Fontconfig to enable Noto Color Emoji fonts where emojis can be displayed, but without binding to prevent errors upon replacing some symbol fonts e.g. Segoe UI Symbol'
arch=('any')
license=('GPL')
depends=('noto-fonts-emoji')
optdepends=()
provides=('noto-color-emoji-fontconfig')
conflicts=('noto-color-emoji-fontconfig')
options=()
source=('75-noto-color-emoji.conf')
sha256sums=('caabbd3f4706912c316c5ef77c6524953685ac087af279d420efa2dbe11514db')

package() {
    local conf_avail='etc/fonts/conf.avail'
    local conf_d='etc/fonts/conf.d/'

    install -Dm655 '75-noto-color-emoji.conf' -t "${pkgdir}/${conf_avail}"
    mkdir -p "${pkgdir}/${conf_d}"
    ln -s "/${conf_avail}/75-noto-color-emoji.conf" "${pkgdir}/${conf_d}"
}
