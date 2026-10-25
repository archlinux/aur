# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ole-storage-lite'
pkgver='0.24'
pkgrel='1'
pkgdesc="Simple Class for OLE document interface."
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/OLE-Storage_Lite'
source=("https://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/OLE-Storage_Lite-${pkgver}.tar.gz")
sha512sums=('5c2fef782b406effae2d8cd1f20cfdded947c9f70e6803f3749eed48a5db57f19cfa956c2e67708437262fcc14c5b72cfbe7cccd12ff30a2ed9885bb6130f4d7')
_distdir="OLE-Storage_Lite-${pkgver}"

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
