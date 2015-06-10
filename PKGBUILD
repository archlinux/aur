# Maintainer: Swiss Privacy Foundation <anonip[at]privacyfoundation[dot]ch>
pkgname=anonip
pkgver=0.5
pkgrel=1
pkgdesc="An ip address anonymizer."
arch=('any')
url="https://www.privacyfoundation.ch/en/services/$pkgname.html"
license=('BSD')
depends=('python2')
source=("https://www.privacyfoundation.ch/assets/files/$pkgname-$pkgver.tar.gz"
        "license.txt")
md5sums=('d2a8381014751968819753ae2899860e'
         '7edc561924bc592f10c65fa782bf7fbf')

package() {
    cd "$srcdir"
    install -d $pkgdir/usr/share/$pkgname
    install -d $pkgdir/usr/share/licenses/$pkgname
    install -d $pkgdir/usr/bin
    install -m644 -t $pkgdir/usr/share/$pkgname/ README README_DE
    install -m644 -t $pkgdir/usr/share/licenses/$pkgname license.txt
    install -m755 $pkgname.py $pkgdir/usr/share/$pkgname/
    ln -sf /usr/share/$pkgname/$pkgname.py $pkgdir/usr/bin/$pkgname
}
