# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Christoph Glaubitz <chris at chrigl dot de>
# Contributor: Bill Sun <cap.sensitive@gmail.com>

set -u
pkgname='ttf-ebgaramond'
pkgver='0.016'
pkgrel='1'
pkgdesc="EB Garamond is an open source project to create a revival of Claude Garamont's famous humanist typeface from the mid-16th century"
arch=('any')
url='http://www.georgduffner.at/ebgaramond/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-ebgaramond')
install="${pkgname}.install"
_verwatch=('https://bitbucket.org/georgd/eb-garamond/downloads' 'EBGaramond-\([0-9\.]\+\).zip' 't')
source=("https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-${pkgver}.zip" 'OFL.txt')
sha256sums=('a0b77b405f55c10cff078787ef9d2389a9638e7604d53aa80207fe62e104c378'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3')

package() {
  set -u
  cd EBGaramond-*/
  install -Dpm644 ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
  install -Dpm644 "${srcdir}/OFL.txt" -t "${pkgdir}/usr/share/licenses/ttf-ebgaramond/"
  set +u
}
set +u
