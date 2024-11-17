# Maintainer: witt <1989161762 at qq dot com>

pkgname=fcitx5-theme-macos12
pkgver=0.0.1
pkgrel=1
url='https://github.com/witt-bit/fcitx5-theme-macos12'
pkgdesc='pink style fcitx5 theme'
arch=('any')
license=('Apache-2.0')
conflicts=('fcitx5-theme-macos12')
provides=('fcitx5-theme-macos12')
options=('!strip')
optdepends=(
    'otf-apple-pingfang: pingfang fonts'
)
source=(
    "themes.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "license::${url}/raw/main/LICENSE"
)
sha256sums=('02da7d2cb6410d910db4941f8667875ffb65fd7634c7c34e812177721ca2e9fe'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    find "${pkgname}-${pkgver}/macos12-light" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/macos12-light/" \;
    find "${pkgname}-${pkgver}/macos12-dark" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/macos12-dark/" \;

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
