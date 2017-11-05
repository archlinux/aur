# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.48'
pkgrel='1'
pkgdesc="Utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Math-Prime-Util-GMP-$pkgver.tar.gz")
md5sums=('83b8958d511f5d17975142d048e80e66')
sha512sums=('7b7ef70d499dbe00acf6a0b88109b4b9d52672e73c0988b9f5b35cd0a7a203010adf73cb216522e9e7c73f979bb18ba22934e4544d37d268bc66bef08107bd6e')
_distdir="Math-Prime-Util-GMP-$pkgver"

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
