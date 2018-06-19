# Maintainer: Martynas Janu <martynas.janu at googlemail dot com>
pkgname=apache-netbeans
pkgver=9.0rc1
pkgrel=1
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
            "83921d031fb5930d0430bf5b3a476e479c40a3bf5a9d92d0e86133722039ff09")

package() {
    mkdir -p $pkgdir/usr/share/apache-netbeans
    mv $srcdir/netbeans $srcdir/apache-netbeans
    cp -Rp $srcdir/apache-netbeans $pkgdir/usr/share
    chmod -R 0644 $pkgdir/usr/share/apache-netbeans
    chmod +x $pkgdir/usr/share/apache-netbeans/bin/netbeans
    install -Dm755 apache-netbeans.desktop "${pkgdir}/usr/share/applications/apache-netbeans.desktop"
}
