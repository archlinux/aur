# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-mojox-validator'
pkgver='0.0016'
pkgrel='1'
pkgdesc="Validator for Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-input-validator' 'perl-mojolicious>=5.81')
makedepends=()
url='https://metacpan.org/release/MojoX-Validator'
source=('http://search.cpan.org/CPAN/authors/id/V/VT/VTI/MojoX-Validator-0.0016.tar.gz')
md5sums=('52093355f92eb7784219a6db0eab81c4')
sha512sums=('ff298577ee4274b5e907a15f0e8889b5b3a0a1010a8d3f87999ffc9776752a7660642caace3762c2db457e82e0637b847bea5b2ef7316e7bea79b6ca9f8e6930')
_distdir="MojoX-Validator-0.0016"

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
