# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-stat-lsmode'
pkgver='0.51'
pkgrel='1'
pkgdesc="format file modes like the C<ls -l> command does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Stat-lsMode'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARISTOTLE/Stat-lsMode-0.51.tar.gz')
md5sums=('7d34325a85c815c2ca744b414048b2fe')
sha512sums=('d1838efb8c6c6b27981247a5380335b167fd92cabbe0492b687ac245b55ddc8628256ef60ee0ec69753b0f4ec8977b547cc4baeac5f88637a7f11bd8467e9ec9')
_distdir="Stat-lsMode-0.51"

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
