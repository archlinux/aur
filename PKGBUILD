# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dumper-concise'
pkgver='2.023'
_distdir="Data-Dumper-Concise-${pkgver}"
pkgrel='1'
pkgdesc="Perl/CPAN Module Data::Dumper::Concise: Less indentation and newlines plus sub deparsing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Data-Dumper-Concise'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/${_distdir}.tar.gz")
md5sums=('12aee80af6ffb8ad9db6f008620300ba')
sha512sums=('cc193bc60228dd3bb1c50d4545ee6a507d80ada27548303bb04fd720504746a2d5a4f32d7c33f52dfaf135a2456e019d794a7d693e2c56df9ea9d0ff385e8cd0')

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
