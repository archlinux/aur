# Contributor: holos
# Contributor: tantalum
# Maintainer: Thomas Koller-Cherek <tk120 at protonmail dot com>

pkgname=guile-json
pkgrel=2
pkgver=3.3.0
pkgdesc='JSON module for Guile'
url="https://github.com/aconchillo/guile-json"
arch=('any')
license=('LGPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ceb7357308d75a9c49dabbddaecf60c9731eda3512b9275a79bb508f628c783d')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check(){
    cd "$pkgname-$pkgver"
    make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
