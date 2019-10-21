# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-random-mt-auto'
pkgver='6.23'
pkgrel='1'
pkgdesc="Auto-seeded Mersenne Twister PRNGs"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-class>=1.32' 'perl-object-insideout>=3.88')
makedepends=()
url='https://metacpan.org/release/Math-Random-MT-Auto'
source=('https://cpan.metacpan.org/authors/id/J/JD/JDHEDDEN/Math-Random-MT-Auto-6.23.tar.gz')
md5sums=('e4f98d4224f3ebca267b6c18dcdefdf2')
sha512sums=('3cdb0a1fee776f6aa91bb7a623bd5b0f2fafa6505fc83352c4b76bdb637b7eb94675fa87b32a0213a1e3baa90e60ddd6330c990f6581abb4dc3cdc7d6e7f8b80')
_distdir="Math-Random-MT-Auto-6.23"

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
