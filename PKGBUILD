# Maintainer: witt <1989161762 at qq dot com>
pkgname=typora-theme-phycat
pkgver=1.4.0
pkgrel=1
pkgdesc="物理猫Typora主题"
arch=('any')
url="https://sumruler.github.io/typora-theme-phycat"
license=('custom')
conflicts=("typora-theme-phycat-git" "typora-theme-phycat-bin")
provides=("typora-theme-phycat")
makedepends=(
    'unzip'
)
optdepends=(
    'typora: Typora editor'
    'typora-free: Free typora editor v0.11.18'
    'typora-cn: Typora editor with Chinese CDN'
)
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/sumruler/typora-theme-phycat/releases/download/v${pkgver}/typora-theme-phycat.zip"
)
sha256sums=('a7219c4d69e47778fdcbd7c2c87cc9b20641b98c66a84c3c8f984930e2e59891')

package() {
    # 以下两行主要为了解决权限不一致问题，实际可以不要
    install -m700 -d "${pkgdir}/${HOME}"
    install -m700 -d "${pkgdir}/${HOME}/.config/Typora"

    install -Dm644 "${srcdir}/"*.css -t "${pkgdir}/${HOME}/.config/Typora/themes"
    install -Dm644 "${srcdir}/phycat/"* -t "${pkgdir}/${HOME}/.config/Typora/themes/phycat"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
