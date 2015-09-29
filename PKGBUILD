# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-strictconstructor'
pkgver='0.19'
pkgrel='1'
pkgdesc="Make your object constructors blow up on unknown attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.94' 'perl-namespace-autoclean')
makedepends=()
checkdepends=('perl-moose' 'perl-test-fatal')
url='https://metacpan.org/release/MooseX-StrictConstructor'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-StrictConstructor-0.19.tar.gz')
md5sums=('66cd34ce309c16e2cfe44ba626916bbb')
sha512sums=('49fe134b4fa9f8deef014851aa851a185f02eb6f75c293e76a1143cb23de760aa46aeefcdb4c22322b545e73058532d35b0924f91de2561277b3f485f7a2fabd')
_distdir="MooseX-StrictConstructor-0.19"

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
