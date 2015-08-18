# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-authen-sasl-saslprep'
pkgver='1.011'
pkgrel='1'
pkgdesc="A Stringprep Profile for User Names and Passwords (RFC 4013)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-unicode-stringprep')
makedepends=()
checkdepends=('perl-test-nowarnings')
url='https://metacpan.org/release/Authen-SASL-SASLprep'
source=('http://search.cpan.org/CPAN/authors/id/C/CF/CFAERBER/Authen-SASL-SASLprep-1.011.tar.gz')
md5sums=('eb9cc1f59968047e23ac44c02a0ecc21')
sha512sums=('c6b2f83afa43ef5ac7df1a1d7cf728ea5d7e5bde6723fcc189d643872530d9f31a3a484e1c10b0af0a5d2d99091122899db14f43559f39494dd0f3f76d20cfd4')
_distdir="Authen-SASL-SASLprep-1.011"

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
