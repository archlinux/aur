# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-leakchecker'
pkgver='0.06'
pkgrel='1'
pkgdesc="Debug memory leaks in Catalyst applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-devel-cycle>=1.11' 'perl-moose>=0.90' 'perl-moosex-types' 'perl-namespace-autoclean' 'perl-namespace-clean>=0.05' 'perl-padwalker>=1.8' 'perl-task-weaken' 'perl-text-simpletable')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-LeakChecker'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/CatalystX-LeakChecker-0.06.tar.gz')
md5sums=('5cba5ffbbdedb754fe4d260fb1727acd')
sha512sums=('6899db31dc2c071d530d7227fc19921fb9ac004831d081f0e6dd2e2a28f3dbff47bd28aece3aa80ae9459e6bc3a65417e297c50e3ee16cfd1183f81bc9cecc3f')
_distdir="CatalystX-LeakChecker-0.06"

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
