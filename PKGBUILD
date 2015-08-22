# Maintainer: mityada <mityada@gmail.com>
pkgname=jbead
pkgver=1.0.23
pkgrel=1
pkgdesc="A bead rope crochet design software"
arch=('any')
url="http://www.jbead.ch/"
license=('GPL3')
depends=('java-runtime')
source=("http://www.jbead.ch/releases/jbead_${pkgver}_linux.tar.gz"
        "jbead")
md5sums=('992459d3e9a50ba47df741fec1a75b9c'
         '646212e9c1c27773bf7c188466eb4ced')

package() {
    cd "$srcdir"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "${pkgname}_$pkgver"

    install -Dm644 "$pkgname.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/share/doc/$pkgname/samples"
    install -m644 samples/*.jbb "$pkgdir/usr/share/doc/$pkgname/samples"
}
