# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-format-sqlite'
pkgver='0.11'
pkgrel='1'
pkgdesc="Parse and format SQLite dates and times"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.1' 'perl-datetime-format-builder>=0.6')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-SQLite'
source=('http://search.cpan.org/CPAN/authors/id/C/CF/CFAERBER/DateTime-Format-SQLite-0.11.tar.gz')
md5sums=('9cc9cc861407a1bbc696226605279842')
sha512sums=('061f831c2a8d653706d315c1cff24ad887e3f8c65afdbd2140066735649c097be921f217e6e2761f8f34604066c618f296d40e9c650c3a1bb085cadbdfa7b7b9')
_distdir="DateTime-Format-SQLite-0.11"

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
