# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libshairport
_developer='amejia1'
_version=1.2.1
_commithash='aeb4987'
pkgver=${_version}
pkgrel=2
pkgdesc='Emulates an AirPort Express'
arch=('i686' 'x86_64')
url='https://github.com/amejia1/libshairport'
license=('GPL')
depends=('openssl' 'libao')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amejia1/libshairport/tarball/$_commithash")
sha256sums=('003c65f56123a7cb090b2d7249f0facbef668f7db6048f4b458713892a6911ca')
options=(!libtool)

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
