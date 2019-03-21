# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='clusteringsuite'
pkgdesc='Automatically expose the main performance trends in applications'\'' computation structure (from BSC).'
pkgver='2.6.8'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(libxml2 boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(dd03a25c03727611260d164ca042c9848bf9d1d21cc71ea5dbbe82ee7322ae47fbecf4ad9bf5e1cfc1bf0612607862f4b8e4166aa271ad42eea244be43b55856)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure \
        --prefix=/usr

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install -j1 # NB: Often fails with parallel install
}
