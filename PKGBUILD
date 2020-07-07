# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libshairport
_developer='amejia1'
_version=1.2.1.20121215
_commithash='16395d8'
pkgver=${_version}
pkgrel=7
pkgdesc="emulates an AirPort Express"
arch=('x86_64')
url='https://github.com/amejia1/libshairport'
license=('GPL')
depends=('openssl' 'libao')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amejia1/libshairport/tarball/$_commithash")
sha256sums=('98b73313d0a8f2abcb32e11f4fd4b422777a495cd62dbe881d5061b91959d1d5')

_srcfolder=$_developer-$pkgname-$_commithash

build() {
  mv "$_srcfolder" "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
