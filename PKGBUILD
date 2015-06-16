# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-declare'
pkgver='0.015'
pkgrel='1'
pkgdesc="EXPERIMENTAL Declarative Syntax for Catalyst Applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.8' 'perl-aliased>=0.30' 'perl-catalyst-controller-actionrole>=0.15' 'perl-class>=1.00' 'perl-class-inspector>=1.24' 'perl-data-dump>=1.14' 'perl-data-pond>=0.002' 'perl-devel-declare>=0.006000' 'perl-moose>=1.14' 'perl-moosex-declare>=0.34' 'perl-moosex-method-signatures>=0.36' 'perl-moosex-methodattributes>=0.24' 'perl-moosex-role-parameterized>=0.19' 'perl-moosex-types>=0.24' 'perl-perl6-junction>=1.40000')
makedepends=('perl-catalyst-runtime' 'perl-test-output>=0.16')
url='http://search.cpan.org/dist/CatalystX-Declare'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/CatalystX-Declare-0.015.tar.gz')
md5sums=('f02e51fd569e8a2562a2af308ef22637')
sha512sums=('7655a3ca2595e2456d2656c3a244b2e94ffbfd8290071e1dd960a24f0c35c7c245a061347ac97a808291ab6b1bf2ef2be60d09ef14578b115ff07f6698e88235')
_distdir="CatalystX-Declare-0.015"

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
