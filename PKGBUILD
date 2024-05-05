# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=tt-rss-data-migration-git
_pkgname=ttrss-data-migration
pkgver=r1.1798758
pkgrel=2
pkgdesc="TT-RSS plugin to import and export all articles"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/plugins/ttrss-data-migration"
license=('GPL-3.0-only')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-data-migration')
conflicts=('tt-rss-data-migration')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _instdir="${pkgdir}/usr/share/webapps/tt-rss/plugins.local/data_migration"
  install -dm755 "${_instdir}"
  install -vDm644 "init.php" "${_instdir}/"
  install -vDm644 "README.md" "${_instdir}/"
}

