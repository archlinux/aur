# Maintainer: atomicfs

pkgname=tt-rss-reddit-delay-git
_gitname=ttrss-reddit-delay
pkgver=74164e7
pkgrel=1
pkgdesc="TT-RSS plugin to delay posts in Reddit feeds by a configurable time"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-reddit-delay"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('ttrss-reddit-delay')
conflicts=('tt-rss-reddit-delay')
source=('git+https://dev.tt-rss.org/tt-rss/ttrss-reddit-delay.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/$_gitname"
  install -dm755 "$_instdir"
  install -vDm644 "$_gitname/init.php" "$_instdir/"
  install -vDm644 "$_gitname/Jenkinsfile" "$_instdir/"
  install -dm755 "$_instdir/sql/mysql"
  install -vDm644 "$_gitname/sql/mysql/schema.sql" "$_instdir/sql/mysql/"
  install -dm755 "$_instdir/sql/pgsql"
  install -vDm644 "$_gitname/sql/pgsql/schema.sql" "$_instdir/sql/pgsql/"
}

