# Maintainer: atomicfs

pkgname=tt-rss-pause-bg-git
_gitname=ttrss-pause-bg
pkgver=5e0850c
pkgrel=1
pkgdesc="TT-RSS plugin to pause HTML5 videos when in background"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-pause-bg"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-pause-bg')
conflicts=('tt-rss-pause-bg')
source=('git+https://dev.tt-rss.org/tt-rss/ttrss-pause-bg.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/af_zz_pause_bg"
  install -dm755 "$_instdir"
  install -vDm644 "$_gitname/init.php" "$_instdir/"
  install -vDm644 "$_gitname/init.js" "$_instdir/"
  install -vDm644 "$_gitname/Jenkinsfile" "$_instdir/"
}

