# Maintainer: Matteo <matteo@localhost>
pkgname=toshiba-satellite-u940-kbdlight-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Toshiba Satellite U940 keyboard backlight 3-mode cycling (OFF/AUTO/ON) via Fn+Z with GNOME OSD"
arch=('any')
url="https://github.com/placeholder/toshiba-satellite-u940-kbdlight-dkms"
license=('GPL-2.0-only')
depends=('dkms')
source=('dkms.conf'
        'Makefile'
        'toshiba_acpi.c')
sha256sums=('c8126844fefbb98cf9059245d8eb6a425d1c264fedbb6ad4e1fca8882d795755'
            '90a6f72c18dd1a492f3732b278bb416fea2297fef66bd045807634885fd99e5d'
            'b44394847b4c6ccac42700d045003530b8f5e430731af5806cf26f43f4bf7d7c')

prepare() {
    sed -i "s/@PKGVER@/$pkgver/" dkms.conf
}

package() {
    local _dkmsname="toshiba-satellite-u940-kbdlight"
    local dest="$pkgdir/usr/src/$_dkmsname-$pkgver"
    install -Dm644 dkms.conf "$dest/dkms.conf"
    install -Dm644 Makefile "$dest/Makefile"
    install -Dm644 toshiba_acpi.c "$dest/toshiba_acpi.c"
}
