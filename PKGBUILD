pkgname=unrar-free
pkgver=0.0.2
pkgrel=1
epoch=1
pkgdesc="Free utility to extract files from RAR archives."
url="https://gitlab.com/bgermann/unrar-free"
arch=('i686' 'x86_64')
depends=("glibc")
license=('GPL', 'custom:Info-ZIP')
source=("https://gitlab.com/bgermann/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('47120c037060fa809b88a12657464a9e66a5dd6d17b550e6c5ecaa84a2026a01')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr --program-suffix=-free
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
