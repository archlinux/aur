# Maintainer: va2bbw <antelaurijssen@gmail.com>

pkgname=yaac
pkgver=1.0beta226
pkgrel=3
pkgdesc="Yet Another APRS Client is a (mostly) platform-independent Java application for monitoring and contributing to the Automatic Packet Reporting System (APRS) network."
arch=('x86_64')
url="https://sourceforge.net/projects/yetanotheraprsc/"
license=('GPL-3.0')
depends=('java-runtime>=8' 'sh')
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}::$url/files/latest/download/YAAC.zip")
sha256sums_x86_64=('67d89444c0b1961fc803ac0db266ded095461e9af132580286222bfb18dbe047')

package() {
    mkdir -p "$pkgdir/opt/yaac/"
    cp -r ./* "$pkgdir/opt/yaac/"
    echo "#!/bin/sh" > yaac
    echo "exec /usr/bin/java -jar '/opt/yaac/YAAC.jar' "$@"" >> yaac
    install -Dm 755 ./yaac "$pkgdir/usr/bin/yaac"
}
sha256sums_x86_64=('67d89444c0b1961fc803ac0db266ded095461e9af132580286222bfb18dbe047')
