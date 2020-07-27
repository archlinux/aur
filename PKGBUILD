# Forked from guile-json 3.4.0 PKGBUILD

# Maintainer: Ting-Wei Lan <lantw44 at gmail dot com>
# Contributor: Thomas Koller-Cherek <tk120 at protonmail dot com>
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json3
_pkgname=guile-json
pkgver=3.4.0
pkgrel=1
pkgdesc='JSON module for Guile (Version 3)'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://download.savannah.gnu.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('716aad1efd445c68224381ebaff0bccf1d9f67afc84af470b0886364af9f5f76')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check(){
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
