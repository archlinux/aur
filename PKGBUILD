## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=rtapp
pkgver=0.8
pkgrel=1
pkgdesc="Realtime application thread priority tuning"
arch=('any')
url="https://www.audio-linux.com"
license=('custom')
depends=('util-linux' 'bash' 'rtirq' 'rt-tests')
optdepends=('linux-rt: The Linux-rt kernel and modules' 'linux-rt-bfq: The Linux-rt kernel and modules with BFQ scheduler' )
install=${pkgname}.install
source=("https://www.audio-linux.com/ftp/packages/$pkgname.tar.gz")
sha256sums=('b4a493e9626383d6ae68d2c4e8bdb7601e305cb05c49b88a48377563b360db49')
backup=('etc/rtapp/rtapp.conf')

package() {
 tar -xf $pkgname.tar.gz -C "$srcdir"
     install -Dm755 "$srcdir/RTapp-new/rtapp" "$pkgdir/usr/bin/rtapp"
     install -Dm755 "$srcdir/RTapp-new/rtstatus" "$pkgdir/usr/bin/rtstatus"
     install -Dm755 "$srcdir/RTapp-new/rttest" "$pkgdir/usr/bin/rttest"
     install -Dm755 "$srcdir/RTapp-new/rtcards" "$pkgdir/usr/bin/rtcards"
     install -Dm755 "$srcdir/RTapp-new/rtjail" "$pkgdir/usr/bin/rtjail"


     install -Dm644 "$srcdir/RTapp-new/rtapp.conf" "$pkgdir/etc/rtapp/rtapp.conf"
     install -Dm644 "$srcdir/RTapp-new/readme.txt" "$pkgdir/usr/share/doc/rtapp/readme.txt"
     install -Dm644 "$srcdir/RTapp-new/rtapp.timer" "$pkgdir/usr/lib/systemd/system/rtapp.timer"
     install -Dm644 "$srcdir/RTapp-new/rtapp.service" "$pkgdir/usr/lib/systemd/system/rtapp.service"
     install -Dm644 "$srcdir/RTapp-new/rtjail.timer" "$pkgdir/usr/lib/systemd/system/rtjail.timer"
     install -Dm644 "$srcdir/RTapp-new/rtjail.service" "$pkgdir/usr/lib/systemd/system/rtjail.service"

}
