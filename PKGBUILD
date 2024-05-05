# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=tt-rss-no-video-preload-git
_pkgname=ttrss-no-video-preload
pkgver=r3.2d4eff2
pkgrel=2
pkgdesc="TT-RSS plugin to stop preloading HTML5 videos, good for slow connections"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/plugins/ttrss-no-video-preload"
license=('GPL-3.0-only')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-no-video-preload')
conflicts=('tt-rss-no-video-preload')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _instdir="${pkgdir}/usr/share/webapps/tt-rss/plugins.local/af_zz_nopreload"
  install -dm755 "${_instdir}"
  install -vDm644 "init.php" "${_instdir}/"
  install -vDm644 "init.js" "${_instdir}/"
}

