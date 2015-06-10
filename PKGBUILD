# Maintainer: Johannes Wienke <languitar at semipol dot de>
# Contributor: James An <james@jamesan.ca>

pkgname=simian
pkgver=2.3.35
pkgrel=1
pkgdesc="A similarity analyser that identifies duplication in Java, C-sharp, C, C++, COBOL, Ruby, JSP, ASP, HTML, XML, Visual Basic, Groovy source code and even plain text files"
arch=('any')
url="http://harukizaemon.com/simian"
license=('custom')
depends=('java-runtime')
source=("http://harukizaemon.com/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname")
md5sums=('f0d1ff48f44251f57937f26baca7d60a'
         '83707665662bb85d5878ff13421f4c4a')

package() {
    msg2 'Adding executable files...'
    install -D -m644 "bin/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    msg2 'Adding license file...'
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    msg2 'Adding doc files...'
    install -D -m755 LICENSE.txt "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
    install -D -m755 simian.* *.html *.gif *.png "$pkgdir/usr/share/doc/$pkgname"
    mv javadoc "$pkgdir/usr/share/doc/$pkgname"
}

