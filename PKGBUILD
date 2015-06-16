# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-anyevent-redis'
pkgver='0.24'
pkgrel='1'
pkgdesc="Non-blocking Redis client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-anyevent')
makedepends=('perl-test-tcp>=1.03')
url='http://search.cpan.org/dist/AnyEvent-Redis'
source=('http://search.cpan.org/CPAN/authors/id/D/DG/DGL/AnyEvent-Redis-0.24.tar.gz')
md5sums=('f3949261b2a7b3b083670ede03e92d94')
sha512sums=('7486b0ce25e2f8a057380b33979f86315be4b924edfa75d526ce1f21d158d3f2241341ef3444580e35409f2af863af93ed85dcb4c1b7658ffab8ba977f4c994c')
_distdir="AnyEvent-Redis-0.24"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
