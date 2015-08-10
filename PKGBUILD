# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname=epson-alcx11-filter
pkgver=1.1
pkgrel=1
pkgdesc="Print driver for Epson ALCX11(NF) colour laser printer"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EAPL')
depends_i686=('libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
depends_x86_64=('lib32-libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
makedepends=()
optdepends=('cups: printing support')
source=("http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/58/70/5009a45a24aeb4868c62e7ede52128006b9188b2/Epson-ALCX11-filter-1.1.tar.gz")
md5sums=('d34baebfa6632121b8f6d6464ba0c2e4')

package() {
    cd $srcdir/Epson-ALCX11-filter-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc
    make DESTDIR=$pkgdir install

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.en.txt $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.ja.txt $pkgdir/usr/share/licenses/$pkgname
}
