# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-method-signatures'
pkgver='0.47'
pkgrel='1'
pkgdesc="Method declarations with type constraints and no source filter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-endofscope>=0.10' 'perl-context-preserve' 'perl-devel-declare>=0.005011' 'perl-eval-closure' 'perl-module-runtime>=0.012' 'perl-moose>=0.89' 'perl-moosex-lazyrequire>=0.06' 'perl-moosex-meta-typeconstraint-forcecoercion' 'perl-moosex-types>=0.35' 'perl-moosex-types-structured>=0.24' 'perl-parse-method-signatures>=1.003014' 'perl-sub-name' 'perl-task-weaken' 'perl-aliased' 'perl-namespace-autoclean' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-moose' 'perl-test-deep' 'perl-test-fatal')
url='http://search.mcpan.org/dist/MooseX-Method-Signatures'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Method-Signatures-0.47.tar.gz')
md5sums=('d338b7a6aae95676a1d29a2cd39069e9')
sha512sums=('47940130b4705b4cbe3419f01fe100074ea07a2b47328f1f70422798634069b73b46242b5e81f371135053e4073eba2b1751c336cc2f888e126183513ac71e9d')
_distdir="MooseX-Method-Signatures-0.47"

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
