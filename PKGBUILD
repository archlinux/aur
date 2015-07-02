# itsol!
pkgname=tt-rss-videoframes-git
_gitname=ttrss-videoframes
pkgver=v0.3.31.g58bcc5a
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
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$_gitname"
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/plugins/videoframes/"
  install -D -m644 videoframes/init.php "$pkgdir/usr/share/webapps/tt-rss/plugins/videoframes/"
}

# vim:set ts=2 sw=2 et:
