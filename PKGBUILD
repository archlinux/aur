# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=tt-rss-no-autoplay-git
_pkgname=ttrss-no-autoplay
pkgver=r4.0850ed8
pkgrel=2
pkgdesc="TT-RSS plugin to stop autoplaying HTML5 videos"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/plugins/ttrss-no-autoplay"
license=('GPL-3.0-only')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-no-autoplay')
conflicts=('tt-rss-no-autoplay')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _instdir="${pkgdir}/usr/share/webapps/tt-rss/plugins.local/af_zz_noautoplay"
  install -dm755 "${_instdir}"
  install -vDm644 "init.php" "${_instdir}/"
  install -vDm644 "init.js" "${_instdir}/"
}

