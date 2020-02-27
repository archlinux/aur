# Maintainer: Ting-Wei Lan <lantw44 at gmail dot com>
# Contributor: Thomas Koller-Cherek <tk120 at protonmail dot com>
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json
pkgver=3.3.0
pkgrel=3
pkgdesc='JSON module for Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
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
