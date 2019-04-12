# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=tt-rss-theme-feedly-git
_gitname=tt-rss-feedly-theme
pkgver=r471.c28269f
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
  cd "$_gitname"

  _instdir="$pkgdir/usr/share/webapps/tt-rss/themes.local/"

  install -d -m755 "$_instdir"

  for f in *.css; do
    install -m644 $f "$_instdir"
  done

  cp -r feedly/ "$_instdir"
}
