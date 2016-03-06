# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka
pkgver=1.8.1
pkgrel=1
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono. Variant: Iosevka, sans-serif.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-variant-hooky' 'ttf-iosevka-variant-zshaped' 'ttf-iosevka-withfw')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('d67126413b83b77342e50c5e469d54905d05b1f86d513546b0b36e14fa355038'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 iosevka/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
