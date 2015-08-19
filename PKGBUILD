# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moox-types-mooselike'
pkgver='0.29'
pkgrel='1'
pkgdesc="some Moosish types and a type builder"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime>=0.014' 'perl-moo>=1.004002')
makedepends=()
checkdepends=('perl-test-fatal>=0.003')
url='https://metacpan.org/release/MooX-Types-MooseLike'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATEU/MooX-Types-MooseLike-0.29.tar.gz')
md5sums=('0905b92c1b44578e05e7f08fa7adb9ee')
sha512sums=('69ddd0d663d1ea23dfc7e47ec35192f1951f195f70f788bac47cc93e98d9e888394c07fc39f1740b7c1fd04f8724f2b0dfa14183fe33bceb9f77c1f1d1b8752e')
_distdir="MooX-Types-MooseLike-0.29"

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
