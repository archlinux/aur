# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-authen-scram'
pkgver='0.005'
pkgrel='1'
pkgdesc="Salted Challenge Response Authentication Mechanism (RFC 5802)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-authen-sasl-saslprep' 'perl-crypt-urandom' 'perl-moo>=1.001000' 'perl-pbkdf2-tiny>=0.003' 'perl-try-tiny' 'perl-type-tiny' 'perl-namespace-clean')
makedepends=()
checkdepends=('perl-test-failwarnings' 'perl-test-fatal')
url='http://search.mcpan.org/dist/Authen-SCRAM'
source=('http://search.mcpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Authen-SCRAM-0.005.tar.gz')
md5sums=('8af86d3644704c3abdddc4843ccc61f3')
sha512sums=('8c183a490eb631e26c22fa19866f12d6e16fedd63169c470d86f6c0ea83df58e5ab2bcb7763455b1a7c179a5c71493dc37f7be2f7431f94f4c6481bd8f808ee5')
_distdir="Authen-SCRAM-0.005"

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
