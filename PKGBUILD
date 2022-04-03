## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=rtapp
pkgver=1.0
pkgrel=1
pkgdesc="Realtime application thread priority tuning"
arch=('any')
url="https://www.audio-linux.com"
license=('custom')
depends=('util-linux' 'bash' 'rtirq')
optdepends=('linux-rt: The Linux-rt kernel and modules' 'linux-rt-bfq: The Linux-rt kernel and modules with BFQ scheduler' )
install=${pkgname}.install
source=('rtapp' 'rtcards' 'rtstatus' 'rtapp.conf' 'rtapp.timer' 'rtapp.service' 'readme.txt')
sha256sums=('f00679d4a97b82f49a82b163d1555fcbdb9ecec6f88ec57ade0f4ca5cdf7ed28'
'db15994d78fae58b5ae748bf5b793babd2464ab210489093a546d564c03a460d'
'6fc74665a8106ec5b032e25c9c9192bd05abb9f8743a271f69212e2c750fd7d8'
'3aee59920ff779de23c60fda6069853b05feac2ce42e795c3aa276726b557124'
'a34e0b3fda04676b28ac2fd194fdaadc99f5ab78b667a1694c94563dbb4918c2'
'ab088bb25e520edcea8eaede7b3a22f4f0608459583615868b9df26ff5a9555a'
'a6e72adb2f0f627962a1067206a0dea0d0e5783ae76d0087bb877a58e5caad1f')
backup=('etc/rtapp/rtapp.conf')

package() {
     install -Dm755 rtapp "$pkgdir/usr/bin/rtapp"
     install -Dm755 rtstatus "$pkgdir/usr/bin/rtstatus"
     install -Dm755 rtcards "$pkgdir/usr/bin/rtcards"

     install -Dm644 rtapp.conf "$pkgdir/etc/rtapp/rtapp.conf"
     install -Dm644 readme.txt "$pkgdir/usr/share/doc/rtapp/readme.txt"
     install -Dm644 rtapp.timer "$pkgdir/usr/lib/systemd/system/rtapp.timer"
     install -Dm644 rtapp.service "$pkgdir/usr/lib/systemd/system/rtapp.service"

}
