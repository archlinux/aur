# Maintainer: Mohamed Alaa <m-alaa8 at ubuntu dot com>
pkgname=media-control-indicator-git
pkgver=r18.779fc73
pkgrel=1
_gitname=media-control-indicator
pkgdesc="A script written in python that uses AppIndicator3 to display an applet to control media using Playerctl and Gtk."
arch=('any')
url="https://github.com/Xaymup/media-control-indicator"
license=('GPL')
conflicts=('media-control-indicator')
provides=('media-control-indicator')
depends=('python-gobject' 'libappindicator-gtk3' 'playerctl' 'python-urllib3' 'adwaita-icon-theme' 'python-colorthief')
makedepends=('git')
source=('git+https://github.com/Xaymup/media-control-indicator.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_gitname
  mkdir -p $pkgdir/usr/bin
  install -D -m755 ./media-control-indicator.py $pkgdir/usr/bin/$_gitname
}
