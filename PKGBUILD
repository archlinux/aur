# Maintainer: willemw <willemw12@gmail.com>

_pkgname=national-geographic-wallpaper
pkgname=$_pkgname-git
pkgver=r47.48fb393
pkgrel=1
pkgdesc="Change wallpaper automatically, for example, with the Photo of The Day of National Geographic"
arch=('any')
url="https://github.com/atareao/national-geographic-wallpaper"
license=('GPL3')
makedepends=('git')
depends=('gtk-update-icon-cache' 'gtk3' 'libnotify' 'python-crontab' 'python-cssselect' 'python-gobject' 'python-lxml' 'python-requests')
optdepends=('cron: automatic download')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=($pkgname::git://github.com/atareao/national-geographic-wallpaper.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -dm755 "$pkgdir/usr/share/national-geographic-wallpaper"
  cp -p src/*.py "$pkgdir/usr/share/national-geographic-wallpaper"

  install -Dm644 data/national-geographic-wallpaper.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/national-geographic-wallpaper.svg"
  install -Dm644 data/national-geographic-wallpaper.desktop "$pkgdir/usr/share/applications/national-geographic-wallpaper.desktop"
}

