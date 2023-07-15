# Maintainer: Alexej Magura <agm2819*gmail*>
#
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rpl
# OLD pkgver=1.4.1
pkgver=1.8rc3
pkgrel=14
pkgdesc="UN*X text replacement utility"
# url="http://www.laffeycomputer.com/rpl.html"
url="https://github.com/rrthomas/rpl"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('python-chardet' 'python')
makedepends=('help2man')
# OLD source=("http://downloads.laffeycomputer.com/current_builds/$pkgname-${pkgver}.tar.gz" "LICENSE")
source=("https://github.com/rrthomas/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('ff7d0537eb0e68a8c9d8567cbee4f018')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # make DESTDIR=$pkgdir install
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -Dm 644 $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}
