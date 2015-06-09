# Maintainer: nosada <ngsksdt@gmail.com>
# Contributor: mitsuse <mitsuset - gmail>

pkgname=maltparser
pkgver=1.8.1
pkgrel=1
pkgdesc="a data-driven parser generator for dependency parsing"
arch=('any')
url="http://www.maltparser.org/"
license=('custom')
depends=("java-environment")
install=maltparser.install
source=(
        "http://maltparser.org/dist/maltparser-$pkgver.tar.gz"
        "maltparser.install"
        "maltparser.sh")
sha1sums=('4451cb6d2da68b818b2e26d55fee1f1fb0717a42'
          '42f22d7ec89db686d7eb491b30061f892046fada'
          '73bfa1c9ff4f216a66088adba221843033a6b2bc')

package() {
    cd $srcdir
    install -d $pkgdir/usr/bin
    install -m755 maltparser.sh $pkgdir/usr/bin/maltparser

    cd $srcdir/$pkgname-$pkgver
    install -d $pkgdir/usr/share/java/maltparser/
    install -d $pkgdir/usr/share/java/maltparser/lib/
    install -d $pkgdir/usr/share/java/maltparser/example/data/
    install -d $pkgdir/usr/share/licenses/maltparser/
    install -m644 README $pkgdir/usr/share/java/maltparser/
    install -m644 NOTICE $pkgdir/usr/share/java/maltparser/
    install -m644 maltparser-$pkgver.jar $pkgdir/usr/share/java/maltparser/
    install -m644 lib/*.jar $pkgdir/usr/share/java/maltparser/lib/
    install -m644 examples/*.xml $pkgdir/usr/share/java/maltparser/example/
    install -m644 examples/data/*.conll $pkgdir/usr/share/java/maltparser/example/data/
    install -m644 LICENSE $pkgdir/usr/share/licenses/maltparser/

    install -d $pkgdir/usr/share/doc/maltparser/
    cp -r docs/* $pkgdir/usr/share/doc/maltparser/
}

# vim:set ts=2 sw=2 et:
