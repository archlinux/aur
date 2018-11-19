# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=jalgo
pkgver=20120214
pkgrel=6
pkgdesc="Algorithm visualization tool written in Java developed at TU Dresden"
arch=('any')
url="http://j-algo.binaervarianz.de/"
license=('GPL')
depends=('java-runtime>=6')
source=("https://downloads.sourceforge.net/project/j-algo/j-algo/$pkgver/j-Algo-linux-complete-$pkgver.tar.gz")
md5sums=('dc3bfcfc1b2b55a3cba63ac90a1cc69e')
sha256sums=('23779874f423bf54e591f9be156c985569bfb7e6136336bd33b4de422fc1dbd3')

package() {
    # create needed dirs
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    # copy fixed files
    cd ..
    chmod +x jalgo.sh
    cp jalgo.sh "$srcdir/j-Algo/jalgo.sh"
    cp jalgo.desktop "$pkgdir/usr/share/applications/jalgo.desktop"
    cp jalgo.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/jalgo.png"
    # move package files to install dir
    mv "$srcdir/j-Algo" "$pkgdir/usr/lib/jalgo"
    cd "$pkgdir/usr/lib/jalgo"
    # remove unsused files
    rm j-Algo.ico
    rm j-Algo.sh
    # link to /usr/bin
    ln -s '/usr/lib/jalgo/jalgo.sh' "$pkgdir/usr/bin/jalgo"
}
