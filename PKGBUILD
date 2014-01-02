# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=2.1.5
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL3')
depends=('phonon')
install="$pkgname.install"
source=("http://flavio.tordini.org/files/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-missing-locale.patch")
md5sums=('e52933f3ae5200f83aa39ac71ac13bfb'
         '70cdaa1d3df700cf90243be5a0d55443')

prepare() {
  cd $pkgname
  # remove missing translations
  patch -p1 -i ../${source[1]}
}

build() {
  cd $pkgname
  qmake-qt4
}

package() {
  cd $pkgname
  make install INSTALL_ROOT="$pkgdir/"
}
