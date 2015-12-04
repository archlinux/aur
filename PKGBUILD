# Maintainer: Aleksej Komarov <stylemistake@gmail.com>

pkgname='warsow-beta-data'
_pkgname='warsow-beta'
pkgver='2.0'
pkgrel='1'
pkgdesc='Free online multiplayer competitive FPS based on the Qfusion engine (data files)'
url='https://www.warsow.gg/'
license=('custom:Warsow Content License')
arch=('any')
source=('http://mirror.null.one/warsow_20_unified.tar.gz')
md5sums=('4c35ac6ca5971e7dcb273dadabc07963')

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
