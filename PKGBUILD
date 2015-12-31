# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-withfw
pkgver=1.6.0
pkgrel=2
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono. Variant: Iosevka plus full-width characters.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka' 'ttf-iosevka-variant-hooky' 'ttf-iosevka-variant-zshaped')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/withfw-iosevka-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('6da7112b9b0ed9cf1292a46a4c8a46734ceba98192f4113791aa445b5da74bc2'
            '79e60eb609efc006ca2a552d998efb1675262d4cae848244a3e2e61df0894b0c')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 withfw-iosevka/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
