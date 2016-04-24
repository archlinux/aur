# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-term-termkey'
pkgver='0.16'
pkgrel='1'
pkgdesc="perl wrapper around libtermkey"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-pkgconfig' 'perl-module-build' 'libtermkey')
makedepends=()
checkdepends=('perl-test-refcount')
url='https://metacpan.org/release/Term-TermKey'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Term-TermKey-0.16.tar.gz')
md5sums=('dfd6c6dffb860bd0bcfb106aea0d43b7')
sha512sums=('792edb8f7bc5af1b11049caf9d2a5a5585c255d4612ac60570a335616867093b533547b369b3a50d1442ddb864afe151c870d2175dc89add4d00617ffe8ea303')
_distdir="Term-TermKey-0.16"

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
