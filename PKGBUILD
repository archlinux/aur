# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-version'
pkgver='1.017'
pkgrel='1'
pkgdesc="Parse and manipulate Perl version strings"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Perl-Version'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Perl-Version-1.017.tar.gz')
md5sums=('21767c76c495ee12f274897990a060f5')
sha512sums=('0aafef2f0fa208502236f1f32cf7e19a5d29b628587f116a46be3b0111036cd0304581b3ca0ab53f6277aedfe18681cf2dea842172289a7ec67124f1f4ef4697')
_distdir="Perl-Version-1.017"

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
