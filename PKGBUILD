# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-githook'
pkgver='0.02'
pkgrel='1'
pkgdesc="Use Git::CPAN::Hook to commit each install in a Git repository"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-git-cpan-hook>=0.03')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-GitHook'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-GitHook-0.02.tar.gz')
md5sums=('7eedf5e8c1820b965c71cb415b0a7356')
sha512sums=('27a2723b86cbc31e355195391df3b3c68951b93c4eb092161fc8889be3f291247354f0e8b86edea842a5b384817e3e6fdf2d9a67ae889af9d590787cc57486ae')
_distdir="CPANPLUS-Dist-GitHook-0.02"

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
