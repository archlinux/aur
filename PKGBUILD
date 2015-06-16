# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mldbm-sync'
pkgver='0.30'
pkgrel='1'
pkgdesc="safe concurrent access to MLDBM databases"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mldbm>=1')
makedepends=()
url='http://search.cpan.org/dist/MLDBM-Sync'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHAMAS/MLDBM-Sync-0.30.tar.gz')
md5sums=('1bb4e8d4bd6a30eee3f1126956409321')
sha512sums=('6ec51617972eb332a9f99f85315497c1acd462cc8f4d91ebe94e698fbf6aaf7de4776a92b3b5dc1adb50f0dfb7e8146c22e727c1a770a62aa775aee3b16c434c')
_distdir="MLDBM-Sync-0.30"

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
