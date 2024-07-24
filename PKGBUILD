#Maintainer: Walter <preparationh67 at gmail dot com>
pkgname=linux-firmware-hauppauge
pkgver=0.2.2
pkgrel=2
pkgdesc="Additional Hauppauge Firmware"
arch=('any')
url="https://www.hauppauge.com/pages/support/support_linux.html"
license=('custom')
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
sha256sums=('de3ce6ff1508617f4256e39ad79227b1707aa60536088e65d3441e4bd8a76c08')
