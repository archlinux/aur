# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Linux System Audit is a clean-room Linux implementation of AIDA64 Business features.
# AIDA64 is the work of FinalWire Ltd. (https://www.aida64.com); Linux System Audit contains no
# AIDA64 code, binaries or data files and is not affiliated with or endorsed by FinalWire.

pkgname=lsa-sysinfo
pkgver=0.1.3
pkgrel=1
pkgdesc="Linux System Audit: clean-room Linux implementation of AIDA64 Business features (AIDA64 by FinalWire Ltd.) - Cache & Memory Benchmark"
arch=('x86_64')
url="https://github.com/eugenesflanagin-spec/lsa-sysinfo"
license=('GPL-2.0-or-later')
depends=('gtk3' 'glib2' 'glibc' 'cairo' 'hicolor-icon-theme' 'hwdata')
optdepends=('srs-sysinfo: srs-root DMI cache for memory speed / type details')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2b0114e1c5e21afc13a2c4a6afc71350e3899d13992b6c69e0252d1bb171c9e')

build() {
  cd "$pkgname-$pkgver"
  make CC=gcc native
}

package() {
  cd "$pkgname-$pkgver"
  make CC=gcc DESTDIR="$pkgdir" SYSPREFIX=/usr install-system
}
