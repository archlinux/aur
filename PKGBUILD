# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=tt-rss-theme-feedly-git
_gitname=tt-rss-feedly-theme
pkgver=r412.a3211e7
pkgrel=1
pkgdesc="Feedly theme for Tiny Tiny RSS"
arch=('any')
url="https://github.com/levito/tt-rss-feedly-theme"
license=('WTFPL')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-theme-feedly')
conflicts=('tt-rss-theme-feedly')
source=('git+https://github.com/levito/tt-rss-feedly-theme.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/themes.local/"
  cd "$_gitname"
  install -d -m755 "$_instdir"
  install -D -m644 feedly.css "$_instdir"
  install -D -m644 feedly-night.css "$_instdir"
  install -D -m644 feedly-ocean.css "$_instdir"
  install -D -m644 feedly-paper.css "$_instdir"
  cp -r feedly/ "$_instdir"
}
