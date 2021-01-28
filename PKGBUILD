# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=roswell
pkgver="21.01.14.108"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/roswell/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
optdepends=()
source=("https://github.com/roswell/roswell/archive/v$pkgver.tar.gz")
b2sums=('b14faf21e2ac5bea96ecb15bee6dbba5bba0238af2629ecc2521ae4d00d1379e0e89c35310202f360790bc50b4859a01a7bdedc33912483e78e086cf3265d2ae')



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
