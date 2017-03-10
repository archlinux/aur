# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-pack
pkgver=1.11.2
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka'
           'ttf-iosevka-term'
           'ttf-iosevka-cc'
           'ttf-iosevka-slab'
           'ttf-iosevka-term-slab'
           'ttf-iosevka-cc-slab'
           'ttf-iosevka-hooky'
           'ttf-iosevka-zshaped'
           'ttf-iosevka-term-hooky'
           'ttf-iosevka-term-zshaped')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/iosevka-pack-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('38b5dd396b4e5139fbdc1d92d02c91f3937e1dd375b37d7bf07f58f7fff4e02e'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
