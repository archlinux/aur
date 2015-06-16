# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-cpan-meta'
pkgver='0.24'
pkgrel='1'
pkgdesc="Validate your CPAN META.yml files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-CPAN-Meta'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/Test-CPAN-Meta-0.24.tar.gz')
md5sums=('b91f2d47eff5945fa40ca0ce62efa4af')
sha512sums=('b81ee69ceef6bb2e43dc3efffd732832e480af5bc55fef31c63d3fbef0e2c92244925ecfb649db5dfa21ae4e7773f41a5e6a96f0282c6f65c325b51a7cfaaf84')
_distdir="Test-CPAN-Meta-0.24"

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
