# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Babets
# Contributor: Vain

pkgname='warsow-beta-data'
_pkgname='warsow-beta'
pkgver='2.0.1'
pkgrel='1'
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine (data files)'
url='https://www.warsow.gg/'
license=('custom:Warsow Content License')
arch=('any')
source=('http://mirror.null.one/warsow_201_unified.tar.gz')
md5sums=('fee194075847f9a2508f65da89b6cfea')

package() {
  local srcdir_wsw="${srcdir}/warsow_20"
  local pkgdir_opt="${pkgdir}/opt/${_pkgname}"

  # Create Destination Directories
  install -d "${pkgdir_opt}/"

  # Move Data to Destination Directory
  cp -r "${srcdir_wsw}"/{basewsw,docs} "${pkgdir_opt}"
  find "${pkgdir_opt}" -type d | xargs chmod 755
  find "${pkgdir_opt}" -type f | xargs chmod 644

  # Install Custom License: Warsow Content License
  install -Dm0644 "${srcdir_wsw}/docs/license.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/license.txt"
}
