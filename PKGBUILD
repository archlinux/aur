# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-session-dialog-git
pkgver=20190126
pkgrel=2
pkgdesc="A graphical Sawfish extension to edit the session preferences"
arch=('any')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('sawfish')
makedepends=('git')
provides=('sawfish-session-dialog=0.41')
conflicts=('sawfish-session-dialog')
source=('sawfish-session-dialog::git+https://github.com/SawfishWM/ssd.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
