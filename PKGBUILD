# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-types-structured'
pkgver='0.30'
pkgrel='1'
pkgdesc="Structured Type Constraints for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-devel-partialdump>=0.13' 'perl-moose>=1.08' 'perl-moosex-types>=0.22' 'perl-moosex-types-datetime' 'perl-sub-exporter>=0.982')
makedepends=()
checkdepends=('perl-test-fatal')
url='http://search.mcpan.org/dist/MooseX-Types-Structured'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-Structured-0.30.tar.gz')
md5sums=('4d896c5e6b5ca47b219d06737abdae82')
sha512sums=('3e9ca8915a86a2d633934fd6b77e820d5a816ff869be292f41850dde3a47757fde9fa1abbecc4305a1746de3c2fb9f183aecd8f56cad3f08c2ee3bfe6089ea8d')
_distdir="MooseX-Types-Structured-0.30"

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
