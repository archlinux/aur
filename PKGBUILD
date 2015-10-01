# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-oneargnew'
pkgver='0.005'
pkgrel='1'
pkgdesc="teach ->new to accept single, non-hashref arguments"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-role-parameterized>=1.01' 'perl-namespace-autoclean')
makedepends=()
url='https://metacpan.org/release/MooseX-OneArgNew'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-OneArgNew-0.005.tar.gz')
md5sums=('60024f3e873280bf6c67f61f14e87bd2')
sha512sums=('0d846346be4eb2deb8a212220991dc727a3ca1fab4109292117dadc8f64fef20ddc93877d198d56974686fbd5d3f4ebf10abd429f08c7fbf1de42975138259ba')
_distdir="MooseX-OneArgNew-0.005"

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
