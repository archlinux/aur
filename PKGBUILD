# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-slab
pkgver=2.3.3
pkgrel=1
pkgdesc='A slender monospace typeface. Shape: default'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/ttc-iosevka-slab-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('28e7560114ed4d21fef3fc32c4eed9638d2a1237ea7e529e0bccce89407c75e6'
            'ecfd74a1d6749bf509cee122870da0186bccfae446e3f6bc5faff253577ab000')

package() {
    install -d ${pkgdir}/usr/share/fonts/${pkgname}
    install -m644 ${srcdir}/*.ttc ${pkgdir}/usr/share/fonts/${pkgname}
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
