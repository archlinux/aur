# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parse-dia-sql'
pkgver='0.25'
pkgrel='1'
pkgdesc="Convert Dia class diagrams into SQL."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-lint' 'perl-log-log4perl' 'perl-text-table' 'perl-xml-dom')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Parse-Dia-SQL'
source=('http://search.cpan.org/CPAN/authors/id/A/AF/AFF/Parse-Dia-SQL-0.25.tar.gz')
md5sums=('3c101225c36a5130567c67d7f7cbb027')
sha512sums=('ffb3e1c6c114480231b199dab7cb0f70312641c2a6cff9de20b99e68fdc66173c7bbafb7ab9b3cd45a8c3cfb72972a02d369f9a689f7167ef8359a79f11ff536')
_distdir="Parse-Dia-SQL-0.25"

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
