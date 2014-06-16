# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=tt-rss-feedmod
_gitname=ttrss_plugin-af_feedmod
pkgver=f668480
pkgrel=1
pkgdesc="Article Filter plugin for Tiny-Tiny-RSS to replace article stubs by website contents"
arch=('any')
url="https://github.com/mbirth/ttrss_plugin-af_feedmod"
license=('GPL2')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-feedmod')
conflicts=('tt-rss-feedmod')
source=('git+https://github.com/mbirth/ttrss_plugin-af_feedmod')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir"
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/plugins/af_feedmod/"
  install -D -m644  ttrss_plugin-af_feedmod/init.php "$pkgdir/usr/share/webapps/tt-rss/plugins/af_feedmod/"
}
