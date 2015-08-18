# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-json-maybexs'
pkgver='1.003005'
pkgrel='1'
pkgdesc="Use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanel-json-xs>=2.3310' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-without-module>=0.17')
url='https://metacpan.org/release/JSON-MaybeXS'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/JSON-MaybeXS-1.003005.tar.gz')
md5sums=('653c088177982f8ac4e6b1697c2c94f4')
sha512sums=('101b5b693eabeaf4e8417d021b3d311b9c8669a0121b97af7781cfbdb3ba24b8aef80d15a3cf4d78b40e47230e9f1c4450c73741675ec6d5ea018c6b06ea49d7')
_distdir="JSON-MaybeXS-1.003005"

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
