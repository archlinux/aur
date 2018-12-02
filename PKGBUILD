pkgname=p7zip-zstd-codec
pkgver=16.02
pkgrel=1
pkgdesc=" ZStandard codec for file archiver p7zip"
arch=('x86_64')
url="https://github.com/tehmul/p7zip-zstd"
license=('LGPL')
depends=('p7zip')
makedepends_i686=('nasm')
makedepends_x86_64=('yasm')
source=("https://github.com/tehmul/p7zip-zstd/archive/7z16.02_zstd_1.1.4.tar.gz")
sha256sums=('b46bd435af730d05df0c7c98f734e158cdc8e1499047c98923bbdab802f6afc2')

build() {
  cd "$srcdir/p7zip-zstd-7z16.02_zstd_1.1.4/p7zip_16.02"
  make ZStd OPTFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/p7zip-zstd-7z16.02_zstd_1.1.4/p7zip_16.02"
  install -Dm755 "bin/Codecs/ZStd.so" "$pkgdir/usr/lib/p7zip/Codecs/ZStd.so"

}