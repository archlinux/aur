# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.33

pkgname='perl-moosex-traits'
pkgver='0.13'
pkgrel='3'
pkgdesc="Automatically apply roles at object creation time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-class-load' 'perl-moose' 'perl-sub-exporter' 'perl-namespace-autoclean' 'perl>=5.006')
makedepends=('perl-module-build-tiny>=0.007')
checkdepends=('perl-moosex-role-parameterized' 'perl-test-fatal' 'perl-test-requires')
url='https://metacpan.org/release/MooseX-Traits'
source=('https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Traits-0.13.tar.gz')
md5sums=('232530e9645abc20a4e7f14fdd022546')
sha512sums=('b5128105e66f2889b6ddfb5b5b871fd952bfe6e08f038cabcc5fa49e9f9f4a806dab06acf9756507613cb6c99e6d633f80c561d85be1d3a1a756039ed29acca2')
b2sums=('92f22677f915555e91722e00832c512995376ce2c9092f300bb38a23fa43b30e1485eca26f24ad5e9458bdab5ae02d12ae1cf11721b7ec87edc58eeca074847e')
_distdir="MooseX-Traits-0.13"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
