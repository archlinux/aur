# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parallel-scoreboard'
pkgver='0.03'
pkgrel='1'
pkgdesc="a scoreboard for monitoring status of many workers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite>=0.05' 'perl-html-parser' 'perl-json')
makedepends=()
url='http://search.cpan.org/dist/Parallel-Scoreboard'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Parallel-Scoreboard-0.03.tar.gz')
md5sums=('5012c8b370ed66db603638c83c5506b7')
sha512sums=('d53c4566a464759d52a209220b4dd1d89389cdd41ae5eec37288a62adc10ed9bb736a9e7d9ce7ca5e61bed5206a67f4affb5bce9b65ca547c9660c03e7a4144a')
_distdir="Parallel-Scoreboard-0.03"

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
