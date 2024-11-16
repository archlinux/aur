# Maintainer: witt <1989161762 at qq dot com>

pkgname=fcitx5-theme-wechat
pkgver=0.0.1
pkgrel=1
url='https://github.com/witt-bit/fcitx5-theme-wechat'
pkgdesc='WeChat style fcitx5 theme'
arch=('any')
license=('Apache-2.0')
conflicts=('fcitx5-theme-wechat')
provides=('fcitx5-theme-wechat')
options=('!strip')
source=(
    "themes.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "license::${url}/raw/main/LICENSE"
)
sha256sums=('61e62886b7d0ed2e4a5d7211cdda098b72c5c4186a3641982e117fd2dd574458'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    find "${pkgname}-${pkgver}/wechat-light" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/wechat-light/" \;
    find "${pkgname}-${pkgver}/wechat-dark" -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/wechat-dark/" \;

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
