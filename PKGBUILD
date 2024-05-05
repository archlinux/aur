# Maintainer: atomicfs

pkgname=tt-rss-reddit-delay-git
_pkgname=ttrss-reddit-delay
pkgver=r5.a07159e
pkgrel=2
pkgdesc="TT-RSS plugin to delay posts in Reddit feeds by a configurable time"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/plugins/ttrss-reddit-delay"
license=('GPL-3.0-only')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-reddit-delay')
conflicts=('tt-rss-reddit-delay')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  _instdir="${pkgdir}/usr/share/webapps/tt-rss/plugins.local/reddit_delay"
  install -dm755 "${_instdir}"
  install -vDm644 "init.php" "${_instdir}/"
  install -dm755  "${_instdir}/sql/mysql"
  install -vDm644 "sql/mysql/schema.sql" "${_instdir}/sql/mysql/"
  install -dm755  "${_instdir}/sql/pgsql"
  install -vDm644 "sql/pgsql/schema.sql" "${_instdir}/sql/pgsql/"
  install -vDm644 "README.md" "${_instdir}/"
}

