## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=rtapp
pkgver=0.9
pkgrel=1
pkgdesc="Realtime application thread priority tuning"
arch=('any')
url="https://www.audio-linux.com"
license=('custom')
depends=('util-linux' 'bash' 'rtirq')
optdepends=('linux-rt: The Linux-rt kernel and modules' 'linux-rt-bfq: The Linux-rt kernel and modules with BFQ scheduler' )
install=${pkgname}.install
source=("https://www.audio-linux.com/ftp/packages/$pkgname.tar.gz")
sha256sums=('71120c7fb6630364f6016500aca230b4055d7bd92b2df980515313fc07f93270')
backup=('etc/rtapp/rtapp.conf')

package() {
 tar -xf $pkgname.tar.gz -C "$srcdir"
     install -Dm755 "$srcdir/RTapp-new/rtapp" "$pkgdir/usr/bin/rtapp"
     install -Dm755 "$srcdir/RTapp-new/rtstatus" "$pkgdir/usr/bin/rtstatus"
     install -Dm755 "$srcdir/RTapp-new/rtcards" "$pkgdir/usr/bin/rtcards"

     install -Dm644 "$srcdir/RTapp-new/rtapp.conf" "$pkgdir/etc/rtapp/rtapp.conf"
     install -Dm644 "$srcdir/RTapp-new/readme.txt" "$pkgdir/usr/share/doc/rtapp/readme.txt"
     install -Dm644 "$srcdir/RTapp-new/rtapp.timer" "$pkgdir/usr/lib/systemd/system/rtapp.timer"
     install -Dm644 "$srcdir/RTapp-new/rtapp.service" "$pkgdir/usr/lib/systemd/system/rtapp.service"

}
