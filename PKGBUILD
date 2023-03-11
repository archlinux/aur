# Maintainer: <max at swk-web.com>

pkgname=shopware-cli
pkgver=0.1.57
pkgrel=1
pkgdesc="A cli which contains handy helpful commands for daily Shopware tasks"
arch=('x86_64')
url="https://github.com/FriendsOfShopware/shopware-cli"
license=('MIT')
optdepends=(
    'dart-sass-embedded: For building admin SCSS using esbuild'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FriendsOfShopware/shopware-cli/releases/download/${pkgver}/${pkgname}_Linux_x86_64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/FriendsOfShopware/shopware-cli/main/LICENSE")
sha256sums=('8f878fd790ee37536c09a5db0b45c8775f97579996a31d8b7e9564095daff010'
            'd7aa16ba3040471c1f8958214ca26e957586f6a95434adc476edbaa9ca3a46ae')

package() {
  install -Dm 644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 "${srcdir}/completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "${srcdir}/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/_${pkgname}"
  install -Dm 644 "${srcdir}/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
