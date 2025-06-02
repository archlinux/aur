#Maintainer: Walter <preparationh67 at gmail dot com>
pkgname=linux-firmware-hauppauge
pkgver=0.2.3
pkgrel=2
pkgdesc="Additional Hauppauge Firmware"
arch=('any')
url="https://www.hauppauge.com/pages/support/support_linux.html"
license=('GPL-3.0-or-later')
conflicts=('hauppauge-wintv-quadhd-firmware')
provides=('hauppauge-wintv-quadhd-firmware')
_source=linux-firmware-hauppauge_$pkgver+focal.tar.gz
_exsource=linux-firmware-hauppauge-$pkgver+focal
source=("http://ppa.launchpad.net/b-rad/kernel+mediatree+hauppauge/ubuntu/pool/main/l/linux-firmware-hauppauge/$_source")

package() {
    tar -xzf "$srcdir/$_source"
    install -d "$pkgdir/usr/lib/firmware"
    for firmware_file in $srcdir/$_exsource/install/0/*.fw
    do
    	install -m644 "$firmware_file" "$pkgdir/usr/lib/firmware/"
    done

}
sha256sums=('a14d9aa96ad14311d97203a4cd426cce87ec8fd54bec24e448524e75ea244923')
