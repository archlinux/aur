# Maintainer: atomicfs

pkgname=tt-rss-no-autoplay-git
_gitname=ttrss-no-autoplay
pkgver=a50e6cf
pkgrel=1
pkgdesc="TT-RSS plugin to stop autoplaying HTML5 videos"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-no-autoplay"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-no-autoplay')
conflicts=('tt-rss-no-autoplay')
source=('git+https://dev.tt-rss.org/tt-rss/ttrss-no-autoplay.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/no-autoplay"
  install -dm755 "$_instdir"
  install -vDm644 "$_gitname/init.php" "$_instdir/"
  install -vDm644 "$_gitname/init.js" "$_instdir/"
  install -vDm644 "$_gitname/Jenkinsfile" "$_instdir/"
}

