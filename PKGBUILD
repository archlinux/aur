# Contributor:  Guilherme M. Nogueira <guilherme@nirev.org>
pkgname=perl-term-size
pkgver=0.2
pkgrel=2
pkgdesc="provides a straightforward way to get the size of the terminal, or window, on which a script is running"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Term-Size/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/T/TI/TIMPX/Term-Size-$pkgver.tar.gz)
md5sums=('982b5df8351e7654a42b7bffc0bf1d57')

build() {
    cd  $srcdir/Term-Size-$pkgver
    # Install into vendor directory
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd $srcdir/Term-Size-$pkgver
    make DESTDIR=$pkgdir install
}
