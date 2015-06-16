# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-carp-repl'
pkgver='0.16'
pkgrel='1'
pkgdesc="read-eval-print-loop on die and/or warn"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-data-dump-streamer' 'perl-devel-lexalias' 'perl-devel-repl' 'perl-devel-stacktrace-withlexicals' 'perl-lexical-persistence' 'perl-namespace-clean')
makedepends=('perl-test-expect')
url='http://search.cpan.org/dist/Carp-REPL'
source=('http://search.cpan.org/CPAN/authors/id/T/TS/TSIBLEY/Carp-REPL-0.16.tar.gz')
md5sums=('f0bb710518e19e5acd005fd97a84fc09')
sha512sums=('083cd5a2536b6ff2bfcc4b430b7c426e007578a1f78418e7848f8735fb77450a9a858faa5bd7548083e4f8df4d59996edbd0ef2ce46a1df83d5c987726296370')
_distdir="Carp-REPL-0.16"

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
