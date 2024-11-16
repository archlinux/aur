# Maintainer: witt <1989161762 at qq dot com>

pkgname=fcitx5-theme-ayaya
pkgver=0.0.1
pkgrel=1
url='https://github.com/witt-bit/fcitx5-theme-ayaya'
pkgdesc='pink style fcitx5 theme'
arch=('any')
license=('Apache-2.0')
conflicts=('fcitx5-theme-ayaya')
provides=('fcitx5-theme-ayaya')
options=('!strip')
optdepends=(
    'ttf-lxgw-wenkai-screen: LXGW WenKai fonts suitable for screen display'
    'ttf-lxgw-wenkai: LXGW WenKai fonts'
)
source=(
    "themes.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "license::${url}/raw/main/LICENSE"
)
sha256sums=('1390108e966c55f4f4cec1770bf5d6e3da60faaaba73146d002db136368b14bc'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    find "${pkgname}-${pkgver}/ayaya-light" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/ayaya-light/" \;
    find "${pkgname}-${pkgver}/ayaya-dark" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/ayaya-dark/" \;

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
