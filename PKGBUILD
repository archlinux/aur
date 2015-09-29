# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-types-common'
pkgver='0.001013'
pkgrel='1'
pkgdesc="A library of commonly used type constraints"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-types' 'perl')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/MooseX-Types-Common'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-Common-0.001013.tar.gz')
md5sums=('0e737459277df34e646b101cc43e684b')
sha512sums=('89712f5bb5653ad434480d2621991637aa5d8f9b349e6514a24937668835ad6ca154b03e8f4c09516c69f604ea465068e9676d8af27bca24e7b31159d5964bb8')
_distdir="MooseX-Types-Common-0.001013"

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
