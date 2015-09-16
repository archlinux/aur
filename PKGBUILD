# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-io-prompt'
pkgver='0.997003'
pkgrel='1'
pkgdesc="Interactively prompt for user input"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-term-readkey' 'perl-want')
makedepends=()
url='https://metacpan.org/release/IO-Prompt'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/IO-Prompt-0.997003.tar.gz')
md5sums=('7607ed49d4f88bdca43e4411af8745df')
sha512sums=('77bb0aee716322879b36cd3d393b58426fe50fb72d415fab16b2546b99f4f5c6b3e3f1da06be9d066baa6c549e2469b4b7c3807373c7b6233a689b6a4357664d')
_distdir="IO-Prompt-0.997003"

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
