# Maintainer: Egor Tensin <egor@tensin.name>
pkgname=grub-reboot-into-windows
pkgver=1.0
pkgrel=1
pkgdesc='Reboot into dual-booted Windows with a Bluetooth keyboard'
arch=(any)
url="https://github.com/egor-tensin/$pkgname"
license=(MIT)
depends=(bash gawk grep)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)
options=('!debug')

package() {
    cd -- "$pkgname-$pkgver"

    install -D -m 0755 -T bin/script.sh "$pkgdir/usr/bin/$pkgname"
    install -D -m 0644 -T share/script.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D -m 0644 -t "$pkgdir/usr/share/$pkgname" share/icon.svg
    install -D -m 0640 -T etc/sudoers "$pkgdir/etc/sudoers.d/$pkgname"
}
