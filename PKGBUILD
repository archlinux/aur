# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-dotted-zero-open-g-hooky-i
pkgver=1.9.3
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'fontforge' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-hooky' 'ttf-iosevka-zshaped' 'ttf-iosevka')
install=${pkgname}.install
# source=("https://github.com/be5invis/Iosevka/archive/master.tar.gz")
source=("https://github.com/be5invis/Iosevka/archive/v${pkgver}.tar.gz")
# md5sums=('SKIP')
md5sums=('f2f3b9b8795b51dc3ee77016cf8fc1a7')

build() {
  # cd "Iosevka-master"
  cd "Iosevka-${pkgver}"
  npm install
  make STYLE_COMMON='v-zero-dotted v-g-opendoublestorey' STYLE_UPRIGHT='v-i-hooky'
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  # install -m644 Iosevka-master/dist/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 Iosevka-${pkgver}/dist/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  # install -m644 Iosevka-master/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 Iosevka-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
