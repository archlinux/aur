# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-encode'
pkgver='1.0.1'
pkgrel='1'
pkgdesc="Simple percent Encoding/Decoding"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/URI-Encode'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MITHUN/URI-Encode-v1.0.1.tar.gz')
md5sums=('2248e3dc1dec341247b16ddf9ead085e')
sha512sums=('dab379ec6fd8e7f3571a02cad172577d1ed4d085401583f12bf4e4df7557dc822ed66f7d63659b10acc7137b4c874a2f833d2f6554995574f35a2e539b31c444')
_distdir="URI-Encode-v1.0.1"

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
