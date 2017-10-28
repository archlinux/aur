# Contributor:  boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

pkgname=perl-authen-oath
pkgver=2.0.1
pkgrel=1
pkgdesc="Perl/CPAN module Authen::OATH "
url="http://search.cpan.org/~sifukurt/Authen-OATH/"
license=(GPL)
arch=('any')
source=("http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/Authen-OATH-2.0.1.tar.gz")
md5sums=('111532b8899c686429584aa9ad1d9660')

build() {
  cd  "$srcdir/Authen-OATH-${pkgver}"
  /usr/bin/perl Makefile.PL \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/
  /usr/bin/make || return 1
}

package(){
  cd  "$srcdir/Authen-OATH-${pkgver}"
  /usr/bin/make DESTDIR=$pkgdir/ install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
