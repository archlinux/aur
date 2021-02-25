# Maintainer: sunflsks <sudhip@nashi.us>

pkgname=libfragmentzip
pkgver=60
pkgrel=1
pkgdesc="A library allowing to download single files from a remote zip archive"
arch=(x86_64)
url="https://github.com/tihmstar/libfragmentzip"
license=('LGPL3')
groups=()
depends=('curl' 'libzip' 'zlib')
makedepends=('git' 'libgeneral')
provides=(libfragmentzip)
conflicts=(libfragmentzip)
source=("https://github.com/tihmstar/libfragmentzip/archive/$pkgver.tar.gz")
md5sums=('99d9d4dc22f424c99b4f7ac1de29672a')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
