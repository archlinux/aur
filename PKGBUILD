# Maintainer: aksr <aksr at t-com dot me>
pkgname=minised
pkgver=1.15
pkgrel=1
epoch=
pkgdesc="A smaller, cheaper, faster SED implementation."
arch=('i686' 'x86_64')
url="http://www.exactcode.com/site/open_source/minised/"
license=('custom:BSD-like')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://dl.exactcode.de/oss/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('2bec1c18ee088a817f463cc2163387f1')
sha1sums=('c1d7f0c5993d004c75befc580692da925880918a')
sha256sums=('ada36a55b71d1f2eb61f2f3b95f112708ce51e69f601bf5ea5d7acb7c21b3481')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

check() {
  cd $srcdir/$pkgname-$pkgver
  make -k check
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

