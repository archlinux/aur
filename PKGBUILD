# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname=epson-alc1100-filter
pkgver=1.2
pkgrel=5
pkgdesc="Print driver for Epson ALC1100 colour laser printer"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EAPL')
depends_i686=('libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
depends_x86_64=('lib32-libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
makedepends=()
optdepends=('cups: printing support')
source=("https://download3.ebz.epson.net/dsc/f/03/00/11/33/07/4027e99517b5c388d444b8444d719b4b77f7e9db/Epson-ALC1100-filter-$pkgver.tar.gz")
md5sums=('d3206f9a2b4d73133ab5baadad0dbe5c')

package() {
    cd $srcdir/Epson-ALC1100-filter-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc
    make DESTDIR=$pkgdir install

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.en.txt $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.ja.txt $pkgdir/usr/share/licenses/$pkgname
}
