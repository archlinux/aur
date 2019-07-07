# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-socialmeta'
pkgver='0.74003'
pkgrel='1'
pkgdesc="Module to generate Social Media Meta Tags, "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-coerce-types-standard>=0.000005' 'perl-list-moreutils>=0.33' 'perl-moo>=1.001001' 'perl-moox-lazierattributes>=1.06' 'perl-moox-validatesubs>=1.012001' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/HTML-SocialMeta'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/HTML-SocialMeta-0.74003.tar.gz')
md5sums=('b934a2ad4c78a70a8263fd9a0d8c5905')
sha512sums=('eabf79f5ed73a03e3efc3e1466d20e5f0042acd1e0e0c979de3137f2720cdb26d02d5443b482c00a383f45217f6a3387e36251488e0e632b70e8d171b4999bdb')
_distdir="HTML-SocialMeta-0.74003"

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
