# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: parchd
pkgname=batterylife
pkgver=1
pkgrel=1
pkgdesc="Help user keep battery between 40 and 80%"
url="https://bbs.archlinux.org/viewtopic.php?pid=1431917"
license=('GPL')
groups=()
depends=('pulseaudio' 'acpi' 'libnotify')
arch=('i686' 'x86_64')
source=('batterylife'
        'batterylife.timer'
        'batterylife.service')

md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.timer" "$pkgdir/etc/systemd/system/$pkgname.timer"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
