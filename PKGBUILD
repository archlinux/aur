# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-lazierattributes'
pkgver='1.07008'
pkgrel='1'
pkgdesc="Lazier Attributes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.39' 'perl-moox-returnmodifiers>=0.03' 'perl-namespace-clean>=0.27' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/MooX-LazierAttributes'
source=('https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-LazierAttributes-1.07008.tar.gz')
md5sums=('75e3e031e13ac25591f3474f75f17311')
sha512sums=('bbaeaa78482723e7501b4eab768c80fbf70b83548ccd953bbe0917b831a29e5a7da7fc459ad84d5283b41024eaf286cefcc0d13eedda3e684e094706adeb00b7')
_distdir="MooX-LazierAttributes-1.07008"

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
