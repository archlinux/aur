# Submitter: Jochum D, jooch (at) gmx (dot) com>
# Maintainer: Jochum D, jooch (at) gmx (dot) com>

pkgname=linux-ck-autobuild
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool to automatically build ck kernels"
arch=('x86_64')
url="https://github.com/j00ch/linux-ck-autobuild"
license=('GPL3')
depends=('zenity' 'grep' 'sed' 'nano')
provides=("$pkgname")
source=("https://github.com/j00ch/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('119020af07fea39f84038f8db49a2e11acc6129d6f230d5fe10068158c736caa')

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname-$pkgver/src/linux-ck-autobuild" "$pkgdir/usr/bin/linux-ck-autobuild"
  install -m755 "$pkgname-$pkgver/src/linux-ck-autobuild-daemon" "$pkgdir/usr/bin/linux-ck-autobuild-daemon"

  install -d "$pkgdir/etc/linux-ck-autobuild"
  install -m644 "$pkgname-$pkgver/src/linux-ck-autobuild-daemon.desktop" "$pkgdir/etc/linux-ck-autobuild/linux-ck-autobuild-daemon.desktop"
  
  install -d "$pkgdir/etc/linux-ck-autobuild"
  install -m644 "$pkgname-$pkgver/src/default.conf" "$pkgdir/etc/linux-ck-autobuild/default.conf"

  install -d "$pkgdir/etc/linux-ck-autobuild"
  install -m644 "$pkgname-$pkgver/src/subarches" "$pkgdir/etc/linux-ck-autobuild/subarches"

  install -d "$pkgdir/usr/lib/systemd/system"  
  install -Dm644 "$pkgname-$pkgver/src/linux-ck-autobuild@.service" "$pkgdir/usr/lib/systemd/system/linux-ck-autobuild@.service"
}
