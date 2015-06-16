# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-profile'
pkgver='0.02'
pkgrel='1'
pkgdesc="Profile your Catalyst application with Devel::NYTProf"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80020' 'perl-catalystx-injectcomponent>=0.024' 'perl-devel-nytprof>=3.01' 'perl-moose>=0.93' 'perl-namespace-autoclean>=0.09' 'perl-sub-identify>=0.04')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-Profile'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/CatalystX-Profile-0.02.tar.gz')
md5sums=('708ab56ebf8707c1668b1a48f3518c2f')
sha512sums=('a2dfc793c70081f2676496db62e81b469f56232d2588a9474da659e91836939c742d67e385625a021ab62ad9c9ff1a4e2d3429edf190b463ee0ad1b1bf6d083a')
_distdir="CatalystX-Profile-0.02"

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
