# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-socialmeta'
pkgver='0.74006'
pkgrel='1'
pkgdesc="Module to generate Social Media Meta Tags, "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-coerce-types-standard>=0.000004' 'perl-list-moreutils>=0.33' 'perl-moo>=1.001001' 'perl-moox-lazierattributes>=1.05' 'perl-moox-validatesubs>=1.012001' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/HTML-SocialMeta'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/HTML-SocialMeta-$pkgver.tar.gz")
md5sums=('d094d95b8612c9fce01340c1f9d0b920')
sha512sums=('5c1f2d3e75d86df6510cba8cb592f7c118c0483aea9cb34ae302359d4d8df28826a1263e728b89493ed833e6a02889d775305826be6aa66c171f585246abff09')
_distdir="HTML-SocialMeta-$pkgver"

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
