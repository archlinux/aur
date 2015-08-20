# Contributor:  boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

pkgname=perl-authen-oath
pkgver=1.0.0
pkgrel=1
pkgdesc="Perl/CPAN module Authen::OATH "
url="http://search.cpan.org/~sifukurt/Authen-OATH/"
license="GPL"
arch=('any')
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIFUKURT/Authen-OATH-v1.0.0.tar.gz')
md5sums=('fb744e4213f9d90b0f6dfbb5ac4dbca3')

build() {
  cd  "$srcdir/Authen-OATH-v1.0.0"
  /usr/bin/perl Makefile.PL \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/
  /usr/bin/make || return 1
}

package(){
  cd  "$srcdir/Authen-OATH-v1.0.0"
  /usr/bin/make DESTDIR=$pkgdir/ install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
