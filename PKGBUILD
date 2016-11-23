# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-hooky
pkgver=1.9.6
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term' 'ttf-iosevka-term-zshaped')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/08.iosevka-term-hooky-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('2b452d0b484705e1a9fe16cb1b433bc4e1b1e17fff7210bd0b5b148696834c42'
            'fcd6a66c181b0bbfd497406ba9eb58c3fae6546e26118868bec48a529a05657f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
