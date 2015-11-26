# Maintainer: Aleksej Komarov <stylemistake@gmail.com>

pkgname='warsow-beta-data'
pkgver='1.6.beta7'
pkgrel='2'
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine (data files)'
url='https://www.warsow.gg/'
license=('custom:Warsow Content License')
arch=('any')
provides=('warsow-data')
conflicts=('warsow-data')
source=('https://www.warsow.gg/1.6-test/test7/warsow_16_TEST7_unified.tar.gz')
md5sums=('8ebf41faebc537ce6bbdc1e66fe11877')

package() {
  local wswdir="${srcdir}/warsow_16"

  # Create Destination Directories
  install -d "${pkgdir}/opt/warsow/"

  # Move Data to Destination Directory
  cp -r "${wswdir}"/{basewsw,docs} "${pkgdir}/opt/warsow"
  find "${pkgdir}/opt/warsow" -type d | xargs chmod 755
  find "${pkgdir}/opt/warsow" -type f | xargs chmod 644

  # Install Custom License: Warsow Content License
  install -Dm0644 "${wswdir}/docs/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
