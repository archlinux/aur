# Maintainer: bar0metr <admin@os-admin.ru>
pkgname=ecap-adapter-sample
_pkgname=ecap_adapter_sample
pkgver=1.0.0
pkgrel=1
pkgdesc='The sample contains three basic adapters (minimal,passthru,modifying,async). Include patches for successful compile and use `modifying` adapter to modify the contents of the whole file'
arch=('x86_64')
url='http://www.e-cap.org/archive/ecap_adapter_sample-1.0.0.tar.gz'
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::$url")
depends=('libecap')
license=('GPL')

sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  chmod +x ./configure
  ./configure
  make -j$(nproc)
}

package() {
  cd "$srcdir"
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

