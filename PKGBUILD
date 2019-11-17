# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-socialmeta'
pkgver='0.74004'
pkgrel='1'
pkgdesc="Module to generate Social Media Meta Tags, "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-coerce-types-standard>=0.000004' 'perl-list-moreutils>=0.33' 'perl-moo>=1.001001' 'perl-moox-lazierattributes>=1.05' 'perl-moox-validatesubs>=1.012001' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/HTML-SocialMeta'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/HTML-SocialMeta-0.74004.tar.gz')
md5sums=('afeb55c843aa2ac93c17f688e2f749be')
sha512sums=('3a47dd810a72329982d617aba87bfae21eeb83aab2edef3500da09fef592f73808d253267336fbd1e53def8e80cf03e5b73e6a8e6dc73b1cb1b682f53cef8159')
_distdir="HTML-SocialMeta-0.74004"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
