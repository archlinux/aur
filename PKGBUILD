# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
pkgname=lettersalad
pkgver=0.5
pkgrel=2
pkgdesc="CLI game - Solve wordsearch puzzles."
arch=('any')
url="http://www.dynamix-tontechnik.ch/linux_lettersalad.html"
license=('GPL')
depends=('python')
source=("http://www.dynamix-tontechnik.ch/code/$pkgname/$pkgver/$pkgname.tar.gz")
md5sums=('599e9eefeb5e0cc130a074b20d89943a')

build() {
    cd "$srcdir"
}

package() {
    install -d $pkgdir/usr/share/$pkgname
    install -d $pkgdir/usr/bin
    install -m644 -t $pkgdir/usr/share/$pkgname/ english.txt german.txt COPYING README CHANGELOG
    install -m755 $pkgname.py $pkgdir/usr/share/$pkgname/
    ln -sf /usr/share/$pkgname/$pkgname.py $pkgdir/usr/bin/$pkgname
}
