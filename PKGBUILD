pkgname=swfmill
pkgver=0.3.2
pkgrel=1
pkgdesc="xml2swf and swf2xml processor with import functionalities"
arch=('i686' 'x86_64')
url="http://swfmill.org"
license=('GPL')
depends=('libxslt' 'freetype2' 'libpng')
source=("http://swfmill.org/releases/$pkgname-$pkgver.tar.gz")
md5sums=('c607f8aba506ec32cc4423446fe6644e')

build() {
    cd $srcdir/$pkgname-$pkgver

    # Configure, make and install
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}