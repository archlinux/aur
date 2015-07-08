# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-chrome-profile
pkgver=20140731
pkgrel=4
_username="user"
_userdir="/home/${_username}"
_profiledir="${_userdir}/.config"
pkgdesc="Google Chrome profile for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-chrome-profile"
license=('unknown')
depends=('justbrowsing-home')
makedepends=('unzip')
optdepends=('google-chrome: web browser')
options=('!strip' '!docs')
source=(https://github.com/justbrowsing/${pkgname}/archive/master.zip)
md5sums=('68d1171c0e085ff27cdf2b263bd1ad22')

package() {
  cd "$srcdir/${pkgname}-master"
  mkdir -p "${pkgdir}/${_profiledir}"
  chmod 0700 "${pkgdir}/${_userdir}"

  cp -dr --preserve=mode,timestamp google-chrome.jb "${pkgdir}/${_profiledir}"
  cp -dr --preserve=mode,timestamp google-chrome "${pkgdir}/${_profiledir}"
  cp -dr --preserve=mode,timestamp google-chrome-beta "${pkgdir}/${_profiledir}"
  cp -dr --preserve=mode,timestamp google-chrome-dev "${pkgdir}/${_profiledir}"
  cp -dr --preserve=mode,timestamp google-chrome-unstable "${pkgdir}/${_profiledir}"
  chmod -R 0700 "${pkgdir}/${_profiledir}/google-chrome.jb"
  chown -R "${_username}:${_username}" "${pkgdir}/${_profiledir}"
}
