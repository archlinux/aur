# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=jdiskreport
pkgver=1.4.1
pkgrel=1
pkgdesc="Enables you to understand your disk drive usage"
arch=('any')
license=('custom')
url="http://www.jgoodies.com/freeware/jdiskreport"
depends=('java-runtime')
source=(http://www.jgoodies.com/download/${pkgname}/${pkgname}-${pkgver//./_}.zip jdiskreport.sh)
sha1sums=('31403da1a4e3f1f4850dc9921594e3fedbb68532'
          '01c20ea36edb362bd174e2cd8972b9793b1166b1')

package() {
    mkdir -p $pkgdir{/usr/bin,/usr/share/{java/$pkgname,doc/$pkgname,licenses/$pkgname}} || return 1
    install -m755 jdiskreport.sh $pkgdir/usr/bin/jdiskreport || return 1
    cd $srcdir/$pkgname-$pkgver || return 1
    mv *.jar $pkgdir/usr/share/java/$pkgname || return 1
    install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/ || return 1
    install -m644 {README,RELEASE-NOTES}.txt $pkgdir/usr/share/doc/$pkgname/ || return 1
}
