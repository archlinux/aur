# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-base-convert'
pkgver='0.11'
pkgrel='2'
pkgdesc="very fast base to base conversion"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Math-Base-Convert'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIKER/Math-Base-Convert-$pkgver.tar.gz")
md5sums=('aed8356d8e2870ee1d27a7b6c5752714')
sha512sums=('4451b41d557d7b3538389bbb525f566264f6c9462339e3b48843b6bb7952576b73a194523716ab44e1fa1df19c243f23fbbfdbae3deef504066d36761526c664')
_distdir="Math-Base-Convert-$pkgver"

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
