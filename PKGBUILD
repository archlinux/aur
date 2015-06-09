# Maintainer: Alexej Magura <agm2819*gmail*>
#
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=rpl
pkgver=1.4.1
pkgrel=13
pkgdesc="UN*X text replacement utility"
url="http://www.laffeycomputer.com/rpl.html"
license=("custom")
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://downloads.laffeycomputer.com/current_builds/$pkgname-${pkgver}.tar.gz" "LICENSE")
md5sums=('2eb9c18d97040dc301bfaa8aa70e21a4' 'dccf3adbdfc376cfb813b05ecb780b70')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    
    ./configure --prefix=/usr \
	--mandir=/usr/share/man

}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR=$pkgdir install

    install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/rpl/LICENSE
}
