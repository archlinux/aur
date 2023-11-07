# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-info'
pkgver='0.37'
pkgrel='1'
pkgdesc="Information about Perl modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-utils>=0.27' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Module-Info'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Info-0.37.tar.gz')
md5sums=('72dd1a99bc124a97888cbbedc37993ca')
sha512sums=('4a9fb295c6a0b7ac701543b292804ce880129b883da7d8f27b255a198e28dc105b11753330c2861241e65898f726a1127c7daf46af09361e3713bdcd5b89227e')
_distdir="Module-Info-0.37"

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
