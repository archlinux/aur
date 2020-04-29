# Maintainer: Ting-Wei Lan <lantw44 at gmail dot com>
# Contributor: Thomas Koller-Cherek <tk120 at protonmail dot com>
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json
pkgver=3.4.0
pkgrel=1
pkgdesc='JSON module for Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('716aad1efd445c68224381ebaff0bccf1d9f67afc84af470b0886364af9f5f76')

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
