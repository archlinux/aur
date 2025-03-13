# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-languageserver'
pkgver='2.6.2'
pkgrel='2'
pkgdesc="Language Server and Debug Protocol Adapter for Perl"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-anyevent>=0' 'perl-anyevent-aio>=0' 'perl-class-refresh>=0' 'perl-compiler-lexer>=0.23' 'perl-coro>=0' 'perl-data-dump>=0' 'perl-encode-locale>=0' 'perl-hash-safekeys>=0' 'perl-io-aio>=0' 'perl-json>=0' 'perl-moose>=0' 'perl-padwalker>=0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Perl-LanguageServer'
source=("http://search.cpan.org/CPAN/authors/id/G/GR/GRICHTER/Perl-LanguageServer-${pkgver}.tar.gz")
md5sums=('3892a82f5d35d0b08c71976ceec490db')
sha512sums=('0154bebbcea73fa83904e77214a518deba39b9dd026728a36c706bf9f5bb134f417a9b5d7794151fe74e40f69132f1589f18641f59ed95be2d406b6dc259a72d')
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
