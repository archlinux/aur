# Maintainer: Jonty Newman <jonty.newman at gmail dot com>
# Contributor: Martynas Janu <martynas.janu at googlemail dot com>
# Contributor: Benjamin Asbach <archlinux-aur.pkgname at impl dot it>
pkgname=apache-netbeans
pkgver=12.6
pkgrel=1
pkgdesc="Apache Netbeans IDE development platform"
arch=('i686' 'x86_64')
url="https://netbeans.apache.org"
license=('Apache')
options=('!strip')
depends=('java-runtime>=8')
provides=('apache-netbeans')
conflicts=('apache-netbeans')
source=("https://downloads.apache.org/netbeans/netbeans/12.6/netbeans-12.6-bin.zip"
        "apache-netbeans.desktop")
sha512sums=("2b41e310eff2c3d87edbe6390afc72606d7e931f8a1fd3529fe42c282b2f87fac6fe29582d8cb2f778997f1fb0cf0ae011f46d7cca591ad0c0c5dea7c944a708"
            "e8160bb80c333a6b478766f176092caa8d87394202c923df22a8f4e3a336a72b0c3ee7f724743b13bfdc785fca32c1b984c2f719b0b153f943a9beaa9d877909")

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
