# Maintainer: Jonas Weber <contact@jonasw.de>
# Contributor: Joshua Haase <hahj87@gmail.com>
pkgname=gpp
pkgver=2.24
pkgrel=2
pkgdesc="A general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks"
arch=('x86_64' 'i686' 'armv7' 'mips64el')
url="http://en.nothingisreal.com/wiki/GPP"
license=('LGPL2.1')
depends=('glibc')
source=(
  "http://files.nothingisreal.com/software/$pkgname/$pkgname-${pkgver}.tar.bz2"
  "http://files.nothingisreal.com/software/$pkgname/$pkgname-${pkgver}.tar.bz2.sig"
)
md5sums=('f04c2a23312ab3d0c462c7972d1c6aa6'
         'SKIP')
# you can get the public key from: http://common.nothingisreal.com/w/images/1/13/EFBF4915.txt
validpgpkeys=("28F47A15AB82C216D278DEB92B119C3AEFBF4915")

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
