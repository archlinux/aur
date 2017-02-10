# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=eggwm
pkgver=0.2
pkgrel=1
pkgdesc="A simple and light Qt4 WM.  100% compatible with the EWMH and ICCCM standards."
url="http://code.google.com/p/eggwm/"
arch=('i686' 'x86_64')
license=("GPL3")
depends=('qt4')
#source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/eggwm/eggwm-$pkgver.tar.gz)
md5sums=('3442e56d9a78a44c349f9e83f15c8eac')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  find installation -type f | xargs chmod -x 
  install -d "$pkgdir/usr/share/eggwm"
  cp -R installation/* "$pkgdir/usr/share/eggwm"
  install -D -m755 eggwm "$pkgdir/usr/bin/eggwm"
}
