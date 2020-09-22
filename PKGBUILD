# Maintainer: Lucie Delestre <me@luclu7.fr>

pkgname=xnotify-git
pkgver=20200921
pkgrel=1
pkgdesc="popup a notification on the screen."
arch=('x86_64')
license=('MIT')
depends=('libx11')
makedepends=('git')
url="https://github.com/phillbush/xnotify.git"
source=('git://github.com/phillbush/xnotify')
md5sums=('SKIP')
_gitname="xnotify"

pkgver() {
  cd $srcdir/$_gitname
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd $srcdir/$_gitname
  make prefix=/usr
}

package() {
  cd $srcdir/$_gitname
  install -Dm0755 $_gitname $pkgdir/usr/bin/$_gitname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_gitname/LICENSE
}
