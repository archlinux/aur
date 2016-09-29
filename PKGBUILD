# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-zshaped
pkgver=1.9.4
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term' 'ttf-iosevka-term-hooky')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/10.iosevka-term-zshaped-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('89ef32c2ccb3c3abf1b8544ea5bb91660cd766c2ecf649dc31c7c5308a60a29c'
            'fcd6a66c181b0bbfd497406ba9eb58c3fae6546e26118868bec48a529a05657f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
