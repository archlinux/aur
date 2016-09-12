# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-yaml-meta'
pkgver='0.22'
pkgrel='1'
pkgdesc="Validate your CPAN META.yml files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-cpan-meta-yaml>=0.17' 'perl-test-yaml-valid>=0.03')
makedepends=()
url='https://metacpan.org/release/Test-YAML-Meta'
source=('http://search.cpan.org/CPAN/authors/id/B/BA/BARBIE/Test-YAML-Meta-0.22.tar.gz')
md5sums=('7e9e10cae83cb3ed0728848a3d1994a6')
sha512sums=('2a11f39703aeb12e1812bfc7ea32401b0c8227bcbf0bab4ea14d95292289854692d4257cee5538ca32f303b0b75fa6793f1090dbcd0c60b34ebd00fb65617bfb')
_distdir="Test-YAML-Meta-0.22"

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
