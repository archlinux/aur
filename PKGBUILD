# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-withfw-cc
pkgver=1.6.3
pkgrel=1
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono. Variant: Iosevka with full-width characters and enwidened symbols.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/withfw-cc-iosevka-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('111873c19f73402ba826f798731a6383a4dcd8894988537f707ee5764b05fac2'
            'f552299cd7287931e62c90eb7dd0a63c29ebd434f92925c2dd3781983aec4338')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 withfw-cc-iosevka/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
