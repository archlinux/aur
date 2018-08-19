# Maintainer: C. Dominik Bódi <domimik dot bodi at gmx dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bareword-filehandles'
pkgver='0.006'
pkgrel='1'
pkgdesc="disables bareword filehandles"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0'
	 'perl>=5.12.0')
makedepends=('perl-extutils-depends')
url='https://metacpan.org/release/bareword-filehandles'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/bareword-filehandles-0.006.tar.gz')
sha512sums=('73cf85f35d10d13d4ad3be471e30cce0a19a899a7c4d033d2202d815dae8e30aa54b2ad7923dba6d798db1c49d2dcbc7c4f72b2d3f1f08e6e009700682d4e65e')
_distdir="bareword-filehandles-0.006"

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
