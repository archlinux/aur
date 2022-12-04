# Maintainer: Ting-Wei Lan <lantw44 at gmail dot com>
# Contributor: Thomas Koller-Cherek <tk120 at protonmail dot com>
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json
pkgver=4.7.3
pkgrel=1
pkgdesc='JSON module for Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('38ba048ed29d12f05b32c5b2fb7a51795c448b41e403a2b1b72ff0035817f388')

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
