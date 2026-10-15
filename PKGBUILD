# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# Linux System Audit is a clean-room Linux implementation of AIDA64 Business features.
# AIDA64 is the work of FinalWire Ltd. (https://www.aida64.com); Linux System Audit contains no
# AIDA64 code, binaries or data files and is not affiliated with or endorsed by FinalWire.

pkgname=lsa-sysinfo
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux System Audit: clean-room Linux implementation of AIDA64 Business features (AIDA64 by FinalWire Ltd.) - Cache & Memory Benchmark"
arch=('x86_64')
url="https://github.com/eugenesflanagin-spec/lsa-sysinfo"
license=('GPL-2.0-or-later')
depends=('gtk3' 'glib2' 'glibc' 'cairo' 'hicolor-icon-theme' 'hwdata')
optdepends=('srs-sysinfo: srs-root DMI cache for memory speed / type details')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('304338db07e3042afd500a614ffdb20fe3e9c357d48192f9c9c2229630a0195c')

build() {
  cd "$pkgname-$pkgver"
  make CC=gcc native
}

package() {
  cd "$pkgname-$pkgver"
  make CC=gcc DESTDIR="$pkgdir" SYSPREFIX=/usr install-system
}
