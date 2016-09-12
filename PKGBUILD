# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-http'
pkgver='0.42'
pkgrel='1'
pkgdesc="Date conversion routines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.17' 'perl-http-date>=1.44')
makedepends=()
url='https://metacpan.org/release/DateTime-Format-HTTP'
source=('http://search.cpan.org/CPAN/authors/id/C/CK/CKRAS/DateTime-Format-HTTP-0.42.tar.gz')
md5sums=('e5dfec811e1f9fe4fc72842f0c56c86f')
sha512sums=('d8ff064d4bd0c9f41ec14a6e06d12a401e9c5162ef1f41381ba4314fc4776d1898cf07971243cf1b4a90096a8ed5f59361616d3fc2d6c62a7bdbdcc331fe81b8')
_distdir="DateTime-Format-HTTP-0.42"

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
