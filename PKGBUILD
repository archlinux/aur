# Maintainer: Martynas Janu <martynas.janu at googlemail dot com>
pkgname=apache-netbeans
pkgver=9.0rc1
pkgrel=5
pkgdesc="Apache Netbeans IDE development platform"
arch=('i686' 'x86_64')
url="https://netbeans.apache.org"
license=('Apache')
options=('!strip')
depends=('jre9-openjdk')
provides=('apache-netbeans')
conflicts=('apache-netbeans')
source=("http://www-eu.apache.org/dist/incubator/netbeans/incubating-netbeans-java/incubating-9.0-rc1/incubating-netbeans-java-9.0-rc1-bin.zip"
        "apache-netbeans.desktop")
sha256sums=("ef326d72aa5c7c2d34550e07c0ebd08cc74025e04f2548379407648ad8bccd02"
            "1f532b1414567911795a5f8f2776452771730bb4a441abd788a6ac3ad097012f")

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
