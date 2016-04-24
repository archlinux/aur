# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-audio-ecasound'
pkgver='1.01'
pkgrel='1'
pkgdesc="Perl binding to the ecasound sampler, recorder, fx-processor"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'ecasound')
makedepends=()
url='https://metacpan.org/release/Audio-Ecasound'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOWMANBS/Audio-Ecasound-1.01.tar.gz')
md5sums=('dfa32c87cfa1fe8432c94c041acd4b09')
sha512sums=('1201ca722d6810263c3356fa714c9b19e25203118462b34b3114d5f42ec74c4b21ba7dc84ad5f72d6271b3f7bc6ed39aee1103b6d581f89c8ae9fd96c83941f6')
_distdir="Audio-Ecasound-1.01"

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
