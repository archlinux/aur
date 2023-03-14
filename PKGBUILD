# Maintainer: atomicfs

pkgname=tt-rss-no-video-preload-git
_gitname=ttrss-no-video-preload
pkgver=cdb8ef4
pkgrel=1
pkgdesc="TT-RSS plugin to stop preloading HTML5 videos, good for slow connections"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-no-video-preload"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-no-video-preload')
conflicts=('tt-rss-no-video-preload')
source=('git+https://dev.tt-rss.org/tt-rss/ttrss-no-video-preload.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/af_zz_nopreload"
  install -dm755 "$_instdir"
  install -vDm644 "$_gitname/init.php" "$_instdir/"
  install -vDm644 "$_gitname/init.js" "$_instdir/"
  install -vDm644 "$_gitname/Jenkinsfile" "$_instdir/"
}

