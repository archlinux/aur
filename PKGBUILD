# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-languageserver'
pkgver='2.2.0'
pkgrel='1'
pkgdesc="Language Server and Debug Protocol Adapter for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=0' 'perl-anyevent-aio>=0' 'perl-class-refresh>=0' 'perl-compiler-lexer>=0.23' 'perl-coro>=0' 'perl-data-dump>=0' 'perl-io-aio>=0' 'perl-json>=0' 'perl-moose>=0' 'perl-padwalker>=0' 'perl>=5.014')
makedepends=()
url='https://metacpan.org/release/Perl-LanguageServer'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRICHTER/Perl-LanguageServer-2.2.0.tar.gz')
md5sums=('ac3c9183c6e5846b9e294f3390445942')
sha512sums=('886e7fe2656a5003cb48d61d809a4f80c1387aadaf6029f33e144aeccd90702fda8a32c1195337a7435dc296d0a15b58b2100a58d8d4508d3df13b5fcb1f2719')
_distdir="Perl-LanguageServer-2.2.0"

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
