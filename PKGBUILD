# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-duration'
pkgver='1.04'
pkgrel='1'
pkgdesc="Format and parse DateTime::Durations"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-params-validate' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/DateTime-Format-Duration'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/DateTime-Format-Duration-1.04.tar.gz')
md5sums=('34298bc24aee006aaae862809e0e8224')
sha512sums=('4c5d849975c271f17a258ea05a2d63b1ce32aab2217f6947cb324c4cee417137744fddb423584a5d2bf4b2b77751c8809dacfac9a625310cecbe5edc0b85b109')
_distdir="DateTime-Format-Duration-1.04"

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
