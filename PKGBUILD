# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=yaac
pkgver=1.0beta229
pkgrel=5
pkgdesc="Yet Another APRS Client is a (mostly) platform-independent Java application for monitoring and contributing to the Automatic Packet Reporting System (APRS) network."
arch=('x86_64')
url="https://sourceforge.net/projects/yetanotheraprsc/"
license=('GPL-3.0')
depends=('java-runtime>=8' 'sh')
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}::$url/files/latest/download/YAAC.zip")

package() {
    mkdir -p "$pkgdir/opt/yaac/"
    cp -r ./* "$pkgdir/opt/yaac/"
    echo "#!/bin/sh" > yaac
    echo "exec /usr/bin/java -jar '/opt/yaac/YAAC.jar' "$@"" >> yaac
    install -Dm 755 ./yaac "$pkgdir/usr/bin/yaac"
}
sha256sums_x86_64=('e64c3fca5fa466f08af49c2104ca604c14d6c1c9d681771408dd07c7db5007e6')
