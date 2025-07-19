# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ole-storage-lite'
pkgver='0.22'
pkgrel='3'
pkgdesc="Simple Class for OLE document interface."
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/OLE-Storage_Lite'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/OLE-Storage_Lite-0.22.tar.gz')
md5sums=('b36bb2b7c624862882f3f06988ce3499')
sha512sums=('672b44f033a8c13fcf6258c2ff08627bd6ed8fe3c105b2c20e9627e361df217511fdb2c7be117634883c5ec050894a64a4d06b21fac252602c0ac1b828bf1dd5')
_distdir="OLE-Storage_Lite-0.22"

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
