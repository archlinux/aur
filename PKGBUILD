# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-languageserver'
pkgver='2.5.0'
pkgrel='2'
pkgdesc="Language Server and Debug Protocol Adapter for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent' 'perl-anyevent-aio' 'perl-class-refresh' 'perl-compiler-lexer>=0.23' 'perl-coro' 'perl-data-dump' 'perl-hash-safekeys' 'perl-io-aio' 'perl-json' 'perl-moose' 'perl-padwalker' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Perl-LanguageServer'
source=("http://search.cpan.org/CPAN/authors/id/G/GR/GRICHTER/Perl-LanguageServer-${pkgver}.tar.gz")
md5sums=('0fff3a712fb49f704c4af22ea809dfee')
sha512sums=('d56f79296b516586671093e3f29b0ae695fb985afc91d29827cef30b1911eede26d2c4897c7acea21e3a6aac714d0d0a7cafdabe9a3e66b0654208110466a4bf')
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
