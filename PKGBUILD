pkgname=libbde
pkgver=20190102
pkgrel=1
pkgdesc="Library and tools to access the BitLocker Drive Encryption (BDE) encrypted volumes"
url="https://github.com/libyal/libbde"
arch=(i686 x86_64)
license=(GPL3)
depends=(openssl)
#_commit=89d624a80729e5e274007bc4aa884652c1b1a976
#source=("git+https://github.com/libyal/libbde#commit=$_commit")
source=("https://github.com/libyal/libbde/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz"
        "https://github.com/libyal/libbde/releases/download/$pkgver/libbde-alpha-$pkgver.tar.gz.asc")
sha256sums=('b20d961907445a4a7525d1cae887c53a049e84ff9a636a645906fdac98a494f6'
            'SKIP')
validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-verbose-output --enable-debug-output
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
