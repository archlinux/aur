# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-action-rest'
pkgver='1.22'
pkgrel='1'
pkgdesc="Automated REST Method Dispatching"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80030' 'perl-class-inspector>=1.13' 'perl-json-maybexs>=0' 'perl-mro-compat>=0.10' 'perl-module-pluggable>=0' 'perl-moose>=1.03' 'perl-params-validate>=0.76' 'perl-uri-find>=0' 'perl-libwww>=0' 'perl-namespace-autoclean>=0')
makedepends=('perl-www-form-urlencoded')
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Catalyst-Action-REST'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-Action-REST-${pkgver}.tar.gz")
md5sums=('841f8ef3e247d0647cd856beb9a459cb')
sha512sums=('8bd71ddba875adb5e0dea4a1541640682ed42cd5a84667e826206e79b9122399a355f771b78cd2bef31b7e825dca87a7a83a305d90270d5e82f120c67a75a876')
_distdir="Catalyst-Action-REST-${pkgver}"

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
