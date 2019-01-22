# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=tt-rss-theme-feedly-git
_gitname=tt-rss-feedly-theme
pkgver=r402.0ca82d3
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
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/themes/"
  install -D -m644 feedly.css "$pkgdir/usr/share/webapps/tt-rss/themes/"
  install -D -m644 feedly-night.css "$pkgdir/usr/share/webapps/tt-rss/themes/"
  cp -r feedly/ "$pkgdir/usr/share/webapps/tt-rss/themes/"
}
