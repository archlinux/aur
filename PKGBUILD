# Maintainer: Jonty Newman <jonty.newman at gmail dot com>
# Contributor: Martynas Janu <martynas.janu at googlemail dot com>
# Contributor: Benjamin Asbach <archlinux-aur.pkgname at impl dot it>
pkgname=apache-netbeans
pkgver=12.0
pkgrel=1
pkgdesc="Apache Netbeans IDE development platform"
arch=('i686' 'x86_64')
url="https://netbeans.apache.org"
license=('Apache')
options=('!strip')
depends=('java-runtime>=8')
provides=('apache-netbeans')
conflicts=('apache-netbeans')
source=("https://www-eu.apache.org/dist/netbeans/netbeans/12.0/netbeans-12.0-bin.zip"
        "apache-netbeans.desktop")
sha512sums=("91030c9628a08acd85f1a58a7f71eec2e57dc85841c1c475cc6311335b5d8cdc10c1198274b9668b7f61a28d04b07661247dc1c3e36b8e29214aec3748e499e4"
            "22eeb1d5af22af6aa88551ea8c8e8a751fe0ed9bc204b3ea79ae1c524c6655ff00e2439f8c62d64187547e5d535512cff43eb6a0a565a7c778fb41a63b34f5e0")

package() {
    mkdir -p $pkgdir/usr/share/apache-netbeans
    mv $srcdir/netbeans $srcdir/apache-netbeans
    cp -R $srcdir/apache-netbeans $pkgdir/usr/share
    chmod -R 0755 $pkgdir/usr/share/apache-netbeans
    chmod +x $pkgdir/usr/share/apache-netbeans/bin/netbeans
    rm -f $pkgdir/usr/share/apache-netbeans/bin/netbeans.exe
    rm -f $pkgdir/usr/share/apache-netbeans/bin/netbeans64.exe
    install -Dm755 apache-netbeans.desktop "${pkgdir}/usr/share/applications/apache-netbeans.desktop"
}
