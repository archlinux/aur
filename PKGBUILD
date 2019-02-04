# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=tt-rss-videoframes-git
_gitname=ttrss-videoframes
pkgver=v0.4
pkgrel=1
pkgdesc="TT-RSS plugin to enable embedded videos in feeds"
arch=('any')
url="https://github.com/tribut/ttrss-videoframes"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-videoframes')
conflicts=('tt-rss-videoframes')
source=('git+https://github.com/tribut/ttrss-videoframes.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/videoframes/"
  cd "$_gitname"
  install -d -m755 "$_instdir"
  install -D -m644 videoframes/init.php "$_instdir"
}

