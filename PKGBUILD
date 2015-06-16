# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sru'
pkgver='1.00'
pkgrel='1'
pkgdesc="Search and Retrieval by URL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-class-accessor' 'perl-cql-parser>=1.12' 'perl-uri' 'perl-xml-libxml' 'perl-xml-simple')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/SRU'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/SRU-1.00.tar.gz')
md5sums=('8f416e85b18a85066692d0bb7880e6fe')
sha512sums=('7677ca5edbb7406b3729af4a1b3c6975cf6ce6c8a2ee509f7410ac8db3c500c17194b5bc9212d652998703e7fdc631f46164209e49f78f60d1a11cd1c0648176')
_distdir="SRU-1.00"

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
