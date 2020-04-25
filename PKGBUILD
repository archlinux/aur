# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=roswell
pkgver="20.04.14.105"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/roswell/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
optdepends=()
source=("https://github.com/roswell/roswell/archive/v$pkgver.tar.gz")
md5sums=('176b2784d53af5a7a1a29926622e32dc')



build() {
  cd "$pkgname-$pkgver"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D COPYING "$pkgdir/usr/share/licenses/roswell/LICENSE"
}
