# Maintainer: Jonty Newman <jonty.newman at gmail dot com>
# Contributor: Martynas Janu <martynas.janu at googlemail dot com>
# Contributor: Benjamin Asbach <archlinux-aur.pkgname at impl dot it>
pkgname=apache-netbeans
pkgver=12.2
pkgrel=1
pkgdesc="Apache Netbeans IDE development platform"
arch=('i686' 'x86_64')
url="https://netbeans.apache.org"
license=('Apache')
options=('!strip')
depends=('java-runtime>=8')
provides=('apache-netbeans')
conflicts=('apache-netbeans')
source=("https://www-eu.apache.org/dist/netbeans/netbeans/12.2/netbeans-12.2-bin.zip"
        "apache-netbeans.desktop")
sha512sums=("b25cda9830e8fe1d05687b08cc5fa9bcac7e8e6d12776998a4da7e483b3be0d04493345e56be7e6198fa8f86428d57d4459bfa7372c2e3f918f4a1101d0a31a7"
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
