# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moox-types-mooselike-numeric'
pkgver='1.02'
pkgrel='1'
pkgdesc="Moo types for numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moox-types-mooselike>=0.23')
makedepends=()
checkdepends=('perl-test-fatal>=0.003')
url='https://metacpan.org/release/MooX-Types-MooseLike-Numeric'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATEU/MooX-Types-MooseLike-Numeric-1.02.tar.gz')
md5sums=('5690122ad6dee3cd36db5532b686094d')
sha512sums=('d1df24ea1a9a59c0ffeb828c541a2cab562b2e95582991ca7b594de200ccc725309b0585adb3392b9c746d34bca243ed606e1a835e07a4dd91c5e3eb84050dc3')
_distdir="MooX-Types-MooseLike-Numeric-1.02"

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
