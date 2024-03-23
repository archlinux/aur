# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-enum'
pkgver='1.12'
pkgrel='1'
pkgdesc="C style enumerated types and bitmask flags in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/enum'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/enum-1.12.tar.gz')
md5sums=('a89225b8c1f5925fefc7788baeedcaa9')
sha512sums=('04c5b5ff185c9e8d41aa056a1be7fb8f95a0063b88f2c9d2678c0c11037f077c3a3502914f0ddd3c67f255b275dcf238a13ca0d23b28addb4e5a7bba0dcfc8ae')
_distdir="enum-1.12"

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
