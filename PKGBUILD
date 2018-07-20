# Maintainer: bar0metr <admin@os-admin.ru>
pkgname=ecap_clamav-adapter
_pkgname=ecap_clamav_adapter
pkgver=2.0.0
pkgrel=2
pkgdesc='The eCAP ClamAV adapter allows the host application to check messages for viruses and other malicious content using a well-known ClamAV(R) antivirus engine. Unlike sample eCAP adapters, the ClamAV adapter is meant for production use'
arch=('x86_64')
url='http://www.e-cap.org/archive/ecap_clamav_adapter-2.0.0.tar.gz'
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::$url")
depends=('libecap' 'clamav')
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

