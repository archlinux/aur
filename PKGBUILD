## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=rtapp
pkgver=0.6.5
pkgrel=4
pkgdesc="Realtime application thread priority tuning"
arch=('any')
url="http://www.audio-linux.com"
license=('custom')
depends=('util-linux' 'bash' 'rtirq')
optdepends=('linux-rt: The Linux-rt kernel and modules'
            'rt-tests: A collection of latency testing tools for the linux(-rt) kernel')
install=${pkgname}.install
source=("http://www.tophifi.it/ftp/packages/$pkgname.tar.gz")
sha256sums=('SKIP')
backup=('etc/rtapp/rtapp.conf')

package() {
 tar -xf $pkgname.tar.gz -C "$srcdir"
     install -Dm755 "$srcdir/RTapp/rtapp" "$pkgdir/usr/bin/rtapp"
     install -Dm755 "$srcdir/RTapp/rtstatus" "$pkgdir/usr/bin/rtstatus"
     install -Dm755 "$srcdir/RTapp/rtreset" "$pkgdir/usr/bin/rtreset"
     install -Dm755 "$srcdir/RTapp/rtmonitorirq" "$pkgdir/usr/bin/rtmonitorirq"
     install -Dm755 "$srcdir/RTapp/rtcheck" "$pkgdir/usr/bin/rtcheck"
     install -Dm755 "$srcdir/RTapp/rttest" "$pkgdir/usr/bin/rttest"

     install -Dm644 "$srcdir/RTapp/rtapp.conf" "$pkgdir/etc/rtapp/rtapp.conf"
     install -Dm644 "$srcdir/RTapp/readme.txt" "$pkgdir/usr/share/doc/rtapp/readme.txt"
     install -Dm644 "$srcdir/RTapp/rtapp.timer" "$pkgdir/usr/lib/systemd/system/rtapp.timer"
     install -Dm644 "$srcdir/RTapp/rtapp.service" "$pkgdir/usr/lib/systemd/system/rtapp.service"
     
     install -Dm644 "$srcdir/RTapp/rtstatus.desktop" "$pkgdir/usr/share/applications/rtstatus.desktop"
     install -Dm644 "$srcdir/RTapp/rtreset.desktop" "$pkgdir/usr/share/applications/rtreset.desktop"
     install -Dm644 "$srcdir/RTapp/rtmonitorirq.desktop" "$pkgdir/usr/share/applications/rtmonitorirq.desktop"
     install -Dm644 "$srcdir/RTapp/rtcheck.desktop" "$pkgdir/usr/share/applications/rtcheck.desktop"
     install -Dm644 "$srcdir/RTapp/rttest.desktop" "$pkgdir/usr/share/applications/rttest.desktop"
}