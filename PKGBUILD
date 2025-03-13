# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-action-rest'
pkgver='1.21'
pkgrel='2'
pkgdesc="Automated REST Method Dispatching"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80030' 'perl-class-inspector>=1.13' 'perl-json-maybexs>=0' 'perl-mro-compat>=0.10' 'perl-module-pluggable>=0' 'perl-moose>=1.03' 'perl-params-validate>=0.76' 'perl-uri-find>=0' 'perl-libwww>=0' 'perl-namespace-autoclean>=0')
makedepends=('perl-www-form-urlencoded')
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Catalyst-Action-REST'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-Action-REST-1.21.tar.gz')
md5sums=('420517e00130f2331c6771071a622001')
sha512sums=('0ff701d24fe4c79e76c6ca6d3ce2520f696fe3b7c31a1e730f643c43d2d593bda4d0ca302d7b3d3714084c1f06e2b664373ec1f33d64fc79d7e1d1a7b99795f0')
_distdir="Catalyst-Action-REST-1.21"

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
