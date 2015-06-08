# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sawfish-session-dialog-git
pkgver=20140825
pkgrel=1
pkgdesc="A graphical Sawfish extension to edit the session preferences"
arch=('any')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('sawfish-git')
makedepends=('git')
provides=('sawfish-session-dialog=0.41')
conflicts=('sawfish-session-dialog')
source=('sawfish-session-dialog::git://github.com/SawfishWM/ssd.git')
md5sums=('SKIP')
_gitname=sawfish-session-dialog

pkgver() {
  cd "$srcdir"/$_gitname
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd "$srcdir"/$_gitname
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir"/$_gitname
  make DESTDIR=$pkgdir install
}
