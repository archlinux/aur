# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-declare'
pkgver='0.40'
pkgrel='1'
pkgdesc="DEPRECATED: Declarative syntax for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-declare>=0.005011' 'perl-list-moreutils' 'perl-module-runtime' 'perl-moose>=0.90' 'perl-moosex-method-signatures>=0.36' 'perl-moosex-role-parameterized>=0.12' 'perl-moosex-types' 'perl-moosex-types-structured' 'perl-parse-method-signatures' 'perl-sub-exporter' 'perl-sub-install' 'perl-aliased' 'perl-namespace-autoclean>=0.09' 'perl-namespace-clean>=0.11' 'perl>=5.006')
makedepends=()
checkdepends=('perl-moose' 'perl-test-fatal')
url='https://metacpan.org/release/MooseX-Declare'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Declare-0.40.tar.gz')
md5sums=('ea405ef8b2f1cedc13f8af8875dd268c')
sha512sums=('2f6dfbfd6463821634aec7df75d045c915f794b4a541a945a65290788eac450c6359c5e21a1c61522b041ca31e6d6ad3b37ce5cc0679a656ace6d4efabe3ff04')
_distdir="MooseX-Declare-0.40"

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
