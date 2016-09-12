# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-cpan-meta-yaml'
pkgver='0.25'
pkgrel='1'
pkgdesc="Validate a META.yml file within a CPAN distribution."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-yaml-valid>=0.03')
makedepends=()
url='https://metacpan.org/release/Test-CPAN-Meta-YAML'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/Test-CPAN-Meta-YAML-0.25.tar.gz')
md5sums=('a7fe1dd638c879433fdc0cbe69a018cf')
sha512sums=('4e908f8aae7511e2251a4f0f7198470e622828b5813d0bc3d78969c87884fc89167ba8243303b4b2c5e0cb97174b1ef582ec5bb2c00eaf410633181bd2c5a19f')
_distdir="Test-CPAN-Meta-YAML-0.25"

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
