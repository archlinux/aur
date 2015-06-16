# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-acpi'
pkgver='0.1'
pkgrel='1'
pkgdesc="Acpi for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Acpi'
source=('http://search.mcpan.org/CPAN/authors/id/S/SH/SHY/acpi/Acpi-0.1.tar.gz')
md5sums=('92359e674987dc492ac99be979aadd36')
sha512sums=('e795be6be950139a4fb36c837a73d22dc390189d185ee04ad761f2cf009155c825c03269a2a4525a1eb3cea7e7bcbcccf951b7237e3aacb65aa342b3658b8385')
_distdir="Acpi-0.1"

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
