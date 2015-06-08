# CPAN Name  : lexical-underscore
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-lexical-underscore'
pkgver='0.003'
pkgrel='1'
pkgdesc="access your caller's lexical underscore"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker>=0' 'perl>=5.8.0')
makedepends=()
url='https://metacpan.org/release/lexical-underscore'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/lexical-underscore-0.003.tar.gz')
md5sums=('a92e40f57ff373d6620d81d0c9b4fb84')
sha512sums=('0753c73290a0fd304b7db483b515737ad5416eaf68892959575347a034b00fc2c9b6503765b8ef2e2e80da73d3c905c4457f0c0094303160c69745d2052014b4')
_distdir="lexical-underscore-0.003"

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
