# $Id: PKGBUILD 216470 2014-07-04 04:21:35Z fyan $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Hunt <lazy at brandnewmath dot com>

pkgname=perl-app-dapper
pkgver=0.18
pkgrel=0
pkgdesc="App::Dapper module"
arch=('any')
url="http://search.cpan.org/~mdb/App-Dapper/bin/dapper"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-datetime-format-xsd' 'perl-file-monitor' 'perl-sub-name' 'perl-http-server-brick' 'perl-text-multimarkdown' 'perl-template-alloy' 'perl-getopt-mixed')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MD/MDB/App-Dapper-0.18.tar.gz")
sha1sums=('ad1a97b666c2460153cddb746420daa54663bfca')

build() {
  cd  $srcdir/App-Dapper-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  $srcdir/App-Dapper-$pkgver
  make test
}

package() {
  cd  $srcdir/App-Dapper-$pkgver
  make install DESTDIR=$pkgdir

  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
