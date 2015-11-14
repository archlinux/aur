# Contributor:  Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=perl-ntlm
pkgver=1.09
pkgrel=1
pkgdesc="Perl/CPAN module NTLM"
url="http://search.cpan.org/~nbebout/NTLM/"
license="GPL"
arch=('any')
source=("http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-${pkgver}.tar.gz")
md5sums=('da314ee94b14af2a2f39b6f2c0046e73')

build() {
  cd  "$srcdir/NTLM-${pkgver}"
  /usr/bin/perl Makefile.PL \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/
  /usr/bin/make || return 1
}

package(){
  cd  "$srcdir/NTLM-${pkgver}"
  /usr/bin/make DESTDIR=$pkgdir/ install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
