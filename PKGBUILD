# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=jdiskreport
pkgver=1.4.1
pkgrel=1
pkgdesc="Enables you to understand your disk drive usage"
arch=('any')
license=('custom')
url='http://www.jgoodies.com/freeware/jdiskreport'
depends=('java-runtime')
source=("http://www.jgoodies.com/download/${pkgname}/${pkgname}-${pkgver//./_}.zip"
        'jdiskreport.sh')
sha512sums=('c1e17bdaab739561ae46475d69805e18be271a0d41b555e981cde59091d6c46fe3cf6775bdd992200edbb4646b7a04003a6b67bfedc18161952a20e47b18ea38'
            'fa397aab23e34e25af073b406c9cab8b1db3a32d6cca6aa182d550df14f073a9dfad94e5ea100ac7e9b3b524dbdcf3e2288e7f4533658951b6f8311b90bbb1a5')

package() {
    mkdir -p $pkgdir{/usr/bin,/usr/share/{java/$pkgname,doc/$pkgname,licenses/$pkgname}}
    install -m755 jdiskreport.sh "$pkgdir/usr/bin/jdiskreport"
    cd "$srcdir/$pkgname-$pkgver"
    mv *.jar "$pkgdir/usr/share/java/$pkgname"
    install -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 {README,RELEASE-NOTES}.txt "$pkgdir/usr/share/doc/$pkgname/"
}
