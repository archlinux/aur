# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-sysrandom'
pkgver='0.007'
pkgrel='1'
pkgdesc="Perl interface to system randomness"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Crypt-SysRandom'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Crypt-SysRandom-$pkgver.tar.gz")
md5sums=('b9c12598fb4cf375a06d190380873d20')
sha512sums=('75d5d89e8d883560f24f4f617afbb57f8953c6f7b96c4934ff8a7d2251ffddffe372ee8b5411011cb4eae0e7d19d4a44dd8414146c50d6bdc9b489ba8a4a23a6')
_distdir="Crypt-SysRandom-$pkgver"

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
