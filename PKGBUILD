# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-languageserver'
pkgver='2.3.0'
pkgrel='1'
pkgdesc="Language Server and Debug Protocol Adapter for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=0' 'perl-anyevent-aio>=0' 'perl-class-refresh>=0' 'perl-compiler-lexer>=0.23' 'perl-coro>=0' 'perl-data-dump>=0' 'perl-io-aio>=0' 'perl-json>=0' 'perl-moose>=0' 'perl-padwalker>=0' 'perl>=5.014')
makedepends=()
url='https://metacpan.org/release/Perl-LanguageServer'
source=("http://search.cpan.org/CPAN/authors/id/G/GR/GRICHTER/Perl-LanguageServer-${pkgver}.tar.gz")
md5sums=('e70de475a1051927d77f8b47cb38376a')
sha512sums=('2ddf79ac566737a99f37250c9d995e3674ae044a9b22d5e2f7c5d206b751db0e6757893cfc18963dc010e4510c54fa377ea8b54b35384ab29f377be15c8006e9')
_distdir="Perl-LanguageServer-${pkgver}"

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
