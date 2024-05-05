# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=tt-rss-pause-bg-git
_pkgname=ttrss-pause-bg
pkgver=r3.504ae25
pkgrel=2
pkgdesc="TT-RSS plugin to pause HTML5 videos when in background"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/plugins/ttrss-pause-bg"
license=('GPL-3.0-only')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-pause-bg')
conflicts=('tt-rss-pause-bg')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _instdir="${pkgdir}/usr/share/webapps/tt-rss/plugins.local/af_zz_pause_bg"
  install -dm755 "${_instdir}"
  install -vDm644 "init.php" "${_instdir}/"
  install -vDm644 "init.js" "${_instdir}/"
  install -vDm644 "README.md" "${_instdir}/"
}

