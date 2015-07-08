# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Franck Michea <franck.michea@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: _@killown.com

pkgname=xcwd-git
pkgver=20141221
pkgrel=1
pkgdesc="xcwd is a simple tool that prints the current working directory of the currently focused window."
arch=('i686' 'x86_64')
license=('BSD')
depends=('libx11')
makedepends=('git')
url="http://github.com/schischi-a/xcwd.git"
source=('git://github.com/schischi-a/xcwd')
md5sums=('SKIP')
_gitname="xcwd"

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
