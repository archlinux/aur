## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=rtapp
pkgver=0.7.1
pkgrel=2
pkgdesc="Realtime application thread priority tuning"
arch=('any')
url="https://www.audio-linux.com"
license=('custom')
depends=('util-linux' 'bash' 'rtirq' 'rt-tests')
optdepends=('linux-rt: The Linux-rt kernel and modules')
install=${pkgname}.install
source=("https://www.audio-linux.com/ftp/packages/$pkgname.tar.gz")
sha256sums=('29c0543bb6f6bb05fe02ff9ec6a253c3046d9c190a0bce70713a6fcf7e3c86a5')
backup=('etc/rtapp/rtapp.conf')

package() {
 tar -xf $pkgname.tar.gz -C "$srcdir"
     install -Dm755 "$srcdir/RTapp-new/rtapp" "$pkgdir/usr/bin/rtapp"
     install -Dm755 "$srcdir/RTapp-new/rtstatus" "$pkgdir/usr/bin/rtstatus"
     install -Dm755 "$srcdir/RTapp-new/rtreset" "$pkgdir/usr/bin/rtreset"
     install -Dm755 "$srcdir/RTapp-new/rtmonitorirq" "$pkgdir/usr/bin/rtmonitorirq"
     install -Dm755 "$srcdir/RTapp-new/rtcheck" "$pkgdir/usr/bin/rtcheck"
     install -Dm755 "$srcdir/RTapp-new/rttest" "$pkgdir/usr/bin/rttest"
     install -Dm755 "$srcdir/RTapp-new/rtcards" "$pkgdir/usr/bin/rtcards"


     install -Dm644 "$srcdir/RTapp-new/rtapp.conf" "$pkgdir/etc/rtapp/rtapp.conf"
     install -Dm644 "$srcdir/RTapp-new/readme.txt" "$pkgdir/usr/share/doc/rtapp/readme.txt"
     install -Dm644 "$srcdir/RTapp-new/rtapp.timer" "$pkgdir/usr/lib/systemd/system/rtapp.timer"
     install -Dm644 "$srcdir/RTapp-new/rtapp.service" "$pkgdir/usr/lib/systemd/system/rtapp.service"
     
     install -Dm644 "$srcdir/RTapp-new/rtstatus.desktop" "$pkgdir/usr/share/applications/rtstatus.desktop"
     install -Dm644 "$srcdir/RTapp-new/rtreset.desktop" "$pkgdir/usr/share/applications/rtreset.desktop"
     install -Dm644 "$srcdir/RTapp-new/rtmonitorirq.desktop" "$pkgdir/usr/share/applications/rtmonitorirq.desktop"
     install -Dm644 "$srcdir/RTapp-new/rtcheck.desktop" "$pkgdir/usr/share/applications/rtcheck.desktop"
     install -Dm644 "$srcdir/RTapp-new/rttest.desktop" "$pkgdir/usr/share/applications/rttest.desktop"
     install -Dm644 "$srcdir/RTapp-new/rtcards.desktop" "$pkgdir/usr/share/applications/rtcards.desktop"

}
