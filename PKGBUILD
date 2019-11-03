# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss01
pkgver=2.3.3
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: Andale Mono'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-ss01-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('c71990c9c5a5f94083065b9eff938b3df0fd2ba9d8a8dc83102b0f1bb629275f'
            'ecfd74a1d6749bf509cee122870da0186bccfae446e3f6bc5faff253577ab000')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}
    install -m644 ${srcdir}/ttf/*.ttf ${pkgdir}/usr/share/fonts/${pkgname}
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
