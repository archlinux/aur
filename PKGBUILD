# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-authen-sasl-saslprep'
pkgver='1.01'
pkgrel='1'
pkgdesc="A Stringprep Profile for User Names and Passwords (RFC 4013)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-unicode-stringprep>=1')
makedepends=()
checkdepends=('perl-test-nowarnings')
url='http://search.mcpan.org/dist/Authen-SASL-SASLprep'
source=('http://search.mcpan.org/CPAN/authors/id/C/CF/CFAERBER/Authen-SASL-SASLprep-1.01.tar.gz')
md5sums=('e1b800b47e360912c382e764c10a58c9')
sha512sums=('62b22ba627e6e41c5db1579ffc1270a964f7e0a0e73292abf844f30057f8a77384138150feadc8d84fe8f6ab765bfb38b85c011db2cdcc72cc7d9db92440a3b4')
_distdir="Authen-SASL-SASLprep-1.01"

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
