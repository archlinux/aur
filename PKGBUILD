# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-poe-component-pluggable'
pkgver='1.28'
pkgrel='1'
pkgdesc="A base class for creating plugin-enabled POE Components."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-poe>=1.004' 'perl-task-weaken>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/POE-Component-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Component-Pluggable-1.28.tar.gz')
md5sums=('e5f8b427108352b4f120c7b0bf419a02')
sha512sums=('2fc89f40b0d44621032bd53e05263dc486733639de4a180679b30b337278ab50746db26c9d8c7416e45ec013da5d88072730ef87f83149c43f81cc6708549094')
_distdir="POE-Component-Pluggable-1.28"

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
