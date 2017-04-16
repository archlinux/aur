# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-action-rest'
pkgver='1.20'
pkgrel='1'
pkgdesc="Automated REST Method Dispatching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80030' 'perl-class-inspector>=1.13' 'perl-json-maybexs>=0' 'perl-mro-compat>=0.10' 'perl-module-pluggable>=0' 'perl-moose>=1.03' 'perl-params-validate>=0.76' 'perl-uri-find>=0' 'perl-libwww>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Catalyst-Action-REST'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-Action-REST-1.20.tar.gz')
md5sums=('3c119d1eafee07d2ce7be7fea082fbab')
sha512sums=('9cff54e88bbeb4853649ee61ae3a2caac6ba108f6507509875d2b2169eff805f668e9345671d487f72d12379ecc94eda086a10fa4017d23a74b526879ba43555')
_distdir="Catalyst-Action-REST-1.20"

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
