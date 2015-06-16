# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-blogger'
pkgver='1.02'
pkgrel='2'
pkgdesc="an OOP-ish interface for accessing a weblog via the Blogger XML-RPC API."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-error' 'perl-http-cookies' 'perl-soap-lite' 'perl-uri')
makedepends=('perl-term-readkey>=42' 'perl-test-simple>=42')
url='http://search.cpan.org/dist/Net-Blogger'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLACO/Net-Blogger-1.02.tar.gz')
md5sums=('ef8d33045999a5fd337583a97e93d9da')
sha512sums=('2d97eb67e8529e71c4f952a9ca78ef57f80ed4ad78a37cbc85982bd88857cbee7c2662b63cda4f62d4d1c16048a7702317ef68dc0152410058973ddf3a59e670')
_distdir="Net-Blogger-1.02"

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
